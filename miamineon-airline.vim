let s:N1 = [ '#141413' , '#00ff00' , 232 , 10  ] " blackestgray & lime
let s:N2 = [ '#87ff00' , '#45413b' , 118 , 238 ] " slime          & deepgray
let s:N3 = [ '#87ffaf' , '#242321' , 121 , 235 ] " seastain       & blackgray
let s:N4 = [ '#666462' , 241 ]                   " mediumgray

let s:I1 = [ '#141413' , '#87ff00' , 232 , 118 ] " blackestgray & slime
let s:I2 = [ '#d7d7ff' , '#d7005f' , 189 , 162 ] " concrete       & hotpink
let s:I3 = [ '#d75f00' , '#242321' , 166 , 235 ] " sunburn        & darkgray

let s:V1 = [ '#141413' , '#87ffaf' , 232 , 121 ] " blackestgray & seastain
let s:V2 = [ '#080808' , '#d7d7ff' , 232 , 189 ] " ink            & concrete
let s:V3 = [ '#d7ff00' , '#242321' , 190 , 235 ] " viceyellow     & blackgray
let s:V4 = [ '#666462' , 241 ]                   " concrete       & purple

let s:RE = [ '#d7ff00' , 190 ]                   " viceyellow
let s:PA = [ '#d7d7ff' , 189 ]                   " concrete

let s:IA = [ s:N2[1] , s:N3[1] , s:N2[3] , s:N3[3] , '' ]

let g:airline#themes#miamineon#palette = {}

let g:airline#themes#miamineon#palette.accents = {
      \ 'hotpink': [ '#d7005f' , '' , 162 , '' , '' ]
      \ }

let g:airline#themes#miamineon#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)
let g:airline#themes#miamineon#palette.normal_modified = {
      \ 'airline_b': [ s:N2[0]   , s:N4[0]   , s:N2[2]   , s:N4[1]   , ''     ] ,
      \ 'airline_c': [ s:V1[1]   , s:N2[1]   , s:V1[3]   , s:N2[3]   , ''     ] }


let g:airline#themes#miamineon#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)
let g:airline#themes#miamineon#palette.insert_modified = {
      \ 'airline_c': [ s:V1[1]   , s:N2[1]   , s:V1[3]   , s:N2[3]   , ''     ] }
let g:airline#themes#miamineon#palette.insert_paste = {
      \ 'airline_a': [ s:I1[0]   , s:PA[0]   , s:I1[2]   , s:PA[1]   , ''     ] }


let g:airline#themes#miamineon#palette.replace = copy(airline#themes#miamineon#palette.insert)
let g:airline#themes#miamineon#palette.replace.airline_a = [ s:I1[0] , s:RE[0] , s:I1[2] , s:RE[1] , '' ]
let g:airline#themes#miamineon#palette.replace_modified = g:airline#themes#miamineon#palette.insert_modified


let g:airline#themes#miamineon#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3)
let g:airline#themes#miamineon#palette.visual_modified = {
      \ 'airline_c': [ s:V3[0]   , s:V4[0]   , s:V3[2]   , s:V4[1]   , ''     ] }


let g:airline#themes#miamineon#palette.inactive = airline#themes#generate_color_map(s:IA, s:IA, s:IA)
let g:airline#themes#miamineon#palette.inactive_modified = {
      \ 'airline_c': [ s:V1[1]   , ''        , s:V1[3]   , ''        , ''     ] }

