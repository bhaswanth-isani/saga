const book = ePub()
let rendition
let displayed
let chapters = []

function loadBook(
  data,
  cfi,
  manager,
  flow,
  spread,
  snap,
  allowScriptedContent,
  direction,
  useCustomSwipe,
  backgroundColor,
  foregroundColor,
) {
  const viewportHeight = window.innerHeight
  document.getElementById('viewer').style.height = viewportHeight
  const uint8Array = new Uint8Array(data)
  book.open(uint8Array)
  rendition = book.renderTo('viewer', {
    manager: manager,
    flow: flow,
    method: "default",
    spread: spread,
    width: '100vw',
    height: '100vh',
    snap: snap && !useCustomSwipe,
    allowScriptedContent: allowScriptedContent,
    defaultDirection: direction,
  })

  if (cfi) {
    displayed = rendition.display(cfi)
  } else {
    displayed = rendition.display()
  }

  displayed.then((renderer) => {
    console.log('displayed')
    window.flutter_inappwebview.callHandler('displayed')
  })

  book.loaded.navigation.then((toc) => {
    chapters = parseChapters(toc)
    window.flutter_inappwebview.callHandler('chapters')
  })

  rendition.on('rendered', () => {
    window.flutter_inappwebview.callHandler('rendered')
  })

  ///text selection callback
  rendition.on('selected', (cfiRange, contents) => {
    book.getRange(cfiRange).then((range) => {
      const selectedText = range.toString()
      const args = [cfiRange.toString(), selectedText]
      window.flutter_inappwebview.callHandler('selection', ...args)
    })
  })

  //book location changes callback
  rendition.on('relocated', (location) => {
    const percent = location.start.percentage
    // var percentage = Math.floor(percent * 100);
    const updatedLocation = {
      startCfi: location.start.cfi,
      endCfi: location.end.cfi,
      progress: percent,
    }
    const args = [updatedLocation]
    window.flutter_inappwebview.callHandler('relocated', ...args)
  })

  rendition.on('displayError', (e) => {
    console.log('displayError')
    window.flutter_inappwebview.callHandler('displayError')
  })

  rendition.on('markClicked', (cfiRange) => {
    console.log('markClicked')
    const args = [cfiRange.toString()]
    window.flutter_inappwebview.callHandler('markClicked', ...args)
  })

  book.ready.then(() => {
    book.locations.generate(1600)
  })

  rendition.hooks.content.register((contents) => {
    if (useCustomSwipe) {
      const el = contents.document.documentElement

      if (el) {
        // console.log('EPUB_TEST_HOOK_IF')
        detectSwipe(el, (el, direction) => {
          // console.log("EPUB_TEST_DIR"+direction.toString())

          if (direction === 'l') {
            rendition.next()
          }
          if (direction === 'r') {
            rendition.prev()
          }
        })
      }
    }
  })

  //set background and foreground color
  updateTheme(backgroundColor, foregroundColor)
}

window.addEventListener('flutterInAppWebViewPlatformReady', (event) => {
  window.flutter_inappwebview.callHandler('readyToLoad')
})

//move to next page
function next() {
  rendition.next()
}

//move to previous page
function previous() {
  rendition.prev()
}

//move to given cfi location
function toCfi(cfi) {
  rendition.display(cfi)
}

//get all chapters
function getChapters() {
  return chapters
}

function getCurrentLocation() {
  const percent = rendition.location.start.percentage
  // var percentage = Math.floor(percent * 100);
  const location = {
    startCfi: rendition.location.start.cfi,
    endCfi: rendition.location.end.cfi,
    progress: percent,
  }
  return location
}

///parsing chapters and subitems recursively
const parseChapters = (toc) => {
  const chapters = []
  for (const chapter of toc) {
    chapters.push({
      title: chapter.label,
      href: chapter.href,
      id: chapter.id,
      subitems: parseChapters(chapter.subitems),
    })
  }
  return chapters
}

function searchInBook(query) {
  search(query).then((data) => {
    const args = [data]
    window.flutter_inappwebview.callHandler('search', ...args)
  })
}

// adds highlight with given color
function addHighlight(cfiRange, color, opacity) {
  rendition.annotations.highlight(
    cfiRange,
    {},
    (e) => {
      // console.log("highlight clicked", e.target);
    },
    'hl',
    { fill: color, 'fill-opacity': '0.3', 'mix-blend-mode': 'multiply' },
  )
}

function addUnderLine(cfiString) {
  rendition.annotations.underline(cfiString)
}

function addMark(cfiString) {
  rendition.annotations.mark(cfiString)
}

function removeHighlight(cfiString) {
  rendition.annotations.remove(cfiString, 'highlight')
}

function removeUnderLine(cfiString) {
  rendition.annotations.remove(cfiString, 'underline')
}

function removeMark(cfiString) {
  rendition.annotations.remove(cfiString, 'mark')
}

function toProgress(progress) {
  const cfi = book.locations.cfiFromPercentage(progress)
  rendition.display(cfi)
}

function search(q) {
  return Promise.all(
    book.spine.spineItems.map((item) =>
      item.load(book.load.bind(book)).then(item.find.bind(item, q)).finally(item.unload.bind(item)),
    ),
  ).then((results) => Promise.resolve([].concat.apply([], results)))
}

function setSpread(spread) {
  rendition.spread(spread)
}

function setFlow(flow) {
  rendition.flow(flow)
}

function setManager(manager) {
  rendition.manager(manager)
}

function setFontSize(fontSize) {
  rendition.themes.fontSize(`${fontSize}px`)
}

//get current page text
function getCurrentPageText() {
  const startCfi = rendition.location.start.cfi
  const endCfi = rendition.location.end.cfi
  const cfiRange = makeRangeCfi(startCfi, endCfi)
  book.getRange(cfiRange).then((range) => {
    const text = range.toString()
    const args = [text, cfiRange]
    window.flutter_inappwebview.callHandler('epubText', ...args)
  })
}

//get text from a range
function getTextFromCfi(startCfi, endCfi) {
  const cfiRange = makeRangeCfi(startCfi, endCfi)
  book.getRange(cfiRange).then((range) => {
    const text = range.toString()
    const args = [text, cfiRange]
    window.flutter_inappwebview.callHandler('epubText', ...args)
  })
}

///update theme
function updateTheme(backgroundColor, foregroundColor) {
  if (backgroundColor && foregroundColor) {
    rendition.themes.register('dark', {
      body: { background: backgroundColor, color: foregroundColor },
    })
    rendition.themes.select('dark')
  }
}

const makeRangeCfi = (a, b) => {
  const CFI = new ePub.CFI()
  const start = CFI.parse(a)
  const end = CFI.parse(b)
  const cfi = {
    range: true,
    base: start.base,
    path: {
      steps: [],
      terminal: null,
    },
    start: start.path,
    end: end.path,
  }
  const len = cfi.start.steps.length
  for (let i = 0; i < len; i++) {
    if (CFI.equalStep(cfi.start.steps[i], cfi.end.steps[i])) {
      if (i === len - 1) {
        // Last step is equal, check terminals
        if (cfi.start.terminal === cfi.end.terminal) {
          // CFI's are equal
          cfi.path.steps.push(cfi.start.steps[i])
          // Not a range
          cfi.range = false
        }
      } else cfi.path.steps.push(cfi.start.steps[i])
    } else break
  }
  cfi.start.steps = cfi.start.steps.slice(cfi.path.steps.length)
  cfi.end.steps = cfi.end.steps.slice(cfi.path.steps.length)

  return (
    `epubcfi(${CFI.segmentString(cfi.base)}!${CFI.segmentString(cfi.path)},${CFI.segmentString(cfi.start)},${CFI.segmentString(cfi.end)})`
  )
}

function detectSwipe(el, func) {
  swipe_det = new Object()
  swipe_det.sX = 0
  swipe_det.sY = 0
  swipe_det.eX = 0
  swipe_det.eY = 0
  const min_x = 50 //min x swipe for horizontal swipe
  const max_x = 40 //max x difference for vertical swipe
  const min_y = 40 //min y swipe for vertical swipe
  const max_y = 50 //max y difference for horizontal swipe
  let direc = ''
  ele = el
  ele.addEventListener(
    'touchstart',
    (e) => {
      const t = e.touches[0]
      swipe_det.sX = t.screenX
      swipe_det.sY = t.screenY
    },
    false,
  )
  ele.addEventListener(
    'touchmove',
    // biome-ignore lint/complexity/useArrowFunction: <explanation>
    function (e) {
      e.preventDefault()
      const t = e.touches[0]
      swipe_det.eX = t.screenX
      swipe_det.eY = t.screenY
    },
    false,
  )
  ele.addEventListener(
    'touchend',
    (e) => {
      //horizontal detection
      if (
        (swipe_det.eX - min_x > swipe_det.sX || swipe_det.eX + min_x < swipe_det.sX) &&
        swipe_det.eY < swipe_det.sY + max_y &&
        swipe_det.sY > swipe_det.eY - max_y
      ) {
        if (swipe_det.eX > swipe_det.sX) direc = 'r'
        else direc = 'l'
      }
      //vertical detection
      if (
        (swipe_det.eY - min_y > swipe_det.sY || swipe_det.eY + min_y < swipe_det.sY) &&
        swipe_det.eX < swipe_det.sX + max_x &&
        swipe_det.sX > swipe_det.eX - max_x
      ) {
        if (swipe_det.eY > swipe_det.sY) direc = 'd'
        else direc = 'u'
      }

      if (direc !== '') {
        if (typeof func === 'function') func(el, direc)
      }
      direc = ''
    },
    false,
  )
}
