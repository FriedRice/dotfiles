" Add more js global objects for syntax highlighting
syntax keyword extraTypescriptGlobalObjects Iterator Map WeakMap Set WeakSet Proxy Promise Buffer ParallelArray ArrayBuffer DataView Float32Array Float64Array Int16Array Int32Array Int8Array Uint16Array Uint32Array Uint8Array Uint8ClampedArray console document window Intl Collator DateTimeFormat NumberFormat fetch decodeURI decodeURIComponent encodeURI encodeURIComponent eval isFinite isNaN parseFloat parseInt uneval

highlight def link extraTypescriptGlobalObjects Special


" Add highlighting for new ? and ?? operators in typescript 3.7
syntax match questionMarkOperator "\(?\)\|\(??\)"
highligh def link questionMarkOperator Boolean

" Overrides for typescript-vim
highlight link typescriptBraces NONE
highlight link typescriptParens NONE
highlight link typescriptEndColons NONE
highlight link typescriptFuncKeyword Type
highlight link typescriptType Structure
highlight link typescriptNull Structure


" Overrides for vim-jsx-typescript
highlight link tsxTagName Constant
highlight link tsxCloseString Constant
highlight link WebBrowser Special


" Overrides for vim-jsx-pretty
highlight link jsxComponentName Constant
