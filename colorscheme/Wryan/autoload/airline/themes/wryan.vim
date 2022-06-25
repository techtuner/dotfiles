let g:airline#themes#wryan#palette = {}

function! airline#themes#wryan#refresh()
    " normal
    let g:airline#themes#wryan#palette.normal = airline#themes#generate_color_map(
                \ [ "#111111", "#53a6a6", 236, 120 ],
                \ [ "#c0c0c0", "#3d3d3d", 254, 240 ],
                \ [ "#53a6a6", "#111111", 120, 236 ]
                \ )
    let g:airline#themes#wryan#palette.normal_modified = {
                \ "airline_c": [ "#53a6a6", "#111111", 120, 236, "bold" ],
                \ }

    " insert
    let g:airline#themes#wryan#palette.insert = airline#themes#generate_color_map(
                \ [ "#111111", "#477ab3", 236, 63 ],
                \ [ "#c0c0c0", "#3d3d3d", 254, 240 ],
                \ [ "#477ab3", "#111111", 63, 236 ]
                \ ) 
    let g:airline#themes#wryan#palette.insert_modified = {
                \ "airline_c": [ "#477ab3", "#111111", 63, 236, "bold" ],
                \ }
    let g:airline#themes#wryan#palette.insert_paste = {
                \ "airline_a": [ "#111111", "#477ab3", 236, 63, "bold" ],
                \ }

    " terminal
    let g:airline#themes#wryan#palette.terminal = airline#themes#generate_color_map(
                \ [ "#111111", "#477ab3", 236, 63 ],
                \ [ "#c0c0c0", "#3d3d3d", 254, 240 ],
                \ [ "#477ab3", "#111111", 63, 236 ]
                \ ) 

    " replace
    let g:airline#themes#wryan#palette.replace = airline#themes#generate_color_map(
                \ [ "#111111", "#6096bf", 236, 38 ],
                \ [ "#c0c0c0", "#3d3d3d", 254, 240 ],
                \ [ "#6096bf", "#111111", 38, 236 ]
                \ )
    let g:airline#themes#wryan#palette.replace_modified = {
                \ "airline_c": [ "#6096bf", "#111111", 38, 236, "bold" ],
                \ }

    " visual
    let g:airline#themes#wryan#palette.visual = airline#themes#generate_color_map(
                \ [ "#111111", "#7e62b3", 236, 140 ],
                \ [ "#c0c0c0", "#3d3d3d", 254, 240 ],
                \ [ "#7e62b3", "#111111", 140, 236 ]
                \ ) 
    let g:airline#themes#wryan#palette.visual_modified = {
                \ "airline_c": [ "#7e62b3", "#111111", 140, 236, "bold" ],
                \ } 

    " inactive
    let g:airline#themes#wryan#palette.inactive = airline#themes#generate_color_map(
                \ [ "#111111", "#c0c0c0", 236, 254 ],
                \ [ "#c0c0c0", "#3d3d3d", 254, 240 ],
                \ [ "#111111", "#c0c0c0", 236, 254 ]
                \ ) 
    let g:airline#themes#wryan#palette.inactive_modified = {
                \ "airline_c": [ "#c0c0c0", "", 254, "", "bold" ],
                \ }
 
    " commandline
    let g:airline#themes#wryan#palette.commandline = airline#themes#generate_color_map(
                \ [ "#111111", "#9e9ecb", 120, 120 ],
                \ [ "#c0c0c0", "#3d3d3d", 254, 240 ],
                \ [ "#9e9ecb", "#111111", 120, 236 ]
                \ ) 

    " accents
    let g:airline#themes#wryan#palette.accents = {
                \ "red": [ "#6096bf", "", 38, "bold" ],
                \ }

    if get(g:, "loaded_ctrlp", 0)
        let g:airline#themes#wryan#palette.ctrlp = airline#extensions#ctrlp#generate_color_map(
                    \ [ "#c0c0c0", "#7e62b3", 254, 140, "bold" ],
                    \ [ "#c0c0c0", "#3d3d3d", 254, 240, "bold" ],
                    \ [ "#7e62b3", "#c0c0c0", 140, 254, "bold" ]
                    \ )
    endif
endfunction

call airline#themes#wryan#refresh()
