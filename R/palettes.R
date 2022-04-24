#' Naruto palette generator
#'
#' These are some color palettes from Naruto.
#'
#'
#' @param name Name of desired palette.
#' @param n Number of colors desired.
#' @param direction Either '1' or '-1'. If '-1' the palette will be reversed.
#' @param type Either "continuous" or "discrete". Use continuous if you want
#'     to automatically interpolate between colours.
#'
#' @return A vector of colours.
#' @export
#' @keywords colors
#'
#' @examples
#' naruto_palette('Team7')
#' naruto_palette('Team7',n=8)
#' \dontrun{
#' naruto_palette("Jiraiya")
#' }
naruto_palette<-function(name,n,direction=1,type=c("discrete","continuous")){

  if(abs(direction) != 1){
    stop("direction must be 1 or -1")
  }

  pal <- naruto_palettes[[name]]
  if(is.null(pal))
    stop("Palette not found")

  if(missing(n)){
    n<-length(pal)
  }

  type<-match.arg(type)

  if(type == "discrete" && n > length(pal)){
    stop(paste0("Number of requested colors greater than waht palstte can offer, which is",
                length(pal),"."))
  }

  out <- switch(type,
                continuous = colorRampPalette(pal)(n),
                discrete = pal[1:n]
                )

  if (direction == -1){
    out<-rev(out)
  }

  structure(out,class="palette",name=name)
}

pal_pal<-function(name,direction){
  function(n){
    naruto_palette(name=name,direction = direction)
  }
}

print.palette<-function(x,...){
  n<-length(x)
  old<-par(mar=c(0.5,0.5,0.5,0.5))
  on.exit(par(old))

  image(1:n,1,as.matrix(1:n),col=x,
        ylab="",xaxt="n",yaxt="n",bty="n")

  rect(0,0.9,n+1,1.1,col=rgb(1,1,1,0.8),border = NA)
  text((n+1)/2,1,labels=attr(x,"name"),cex=1,family="serif")
}
