#!/bin/bash

ls icons/???.png | awk 'BEGIN{
  max=1;
}{
  id = $0
  sub("icons/", "", id);
  sub(".png", "", id);
  a[id] = 1;
  if (id > max) { max = id+0; }
}
END{
  files=""
  for (i = 0; i <= max; i++) {
    id = sprintf("%03i", i)
    if (a[id]) {
      files = files " icons/" id ".png"
    } else {
      files = files " icons/x.png"
    }
  }
  width=20
  height=max/width+1
  command = "montage " files " -tile "width"x"height" -geometry 40x40+1+1 icons/sprite.jpg"
  system(command)
}'