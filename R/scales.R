#' Discrete scales to use for ggplot2
#'
#' These functions provide the option to use \code{Naruto} colours inside discrete
#' palettes with the `ggplot2` package.
#'
#' @rdname  ggplot2-scales-discrete
#'
#'
#' @inheritParams naruto_palette
#' @param ... additional arguments to pass to discrete_scale
#'
#' @return
#' @export
#'
#' @examples
#'
#' if (require('ggplot2)){
#' dat01<-data.frame(x=LETTERS[1:5],y=1:5)
#' ggplot(data=dat01,aes(x=x,y=y,color=x))+
#' geom_col()+
#' scale_color_naruto_d(name="Jiraiya")
#' }
scale_colour_naruto_d<-function(name,direction=1,...){

  if(!requireNamespace("ggplot2",quietly = TRUE)){
    stop('ggplot2 is required for this functionality',call. = FALSE)
  }

  ggplot2::discrete_scale("colour",scale_name = name,
                          pal_pal(name=name,direction=direction),...)
}

scale_color_naruto_d <- scale_colour_naruto_d

#' @rdname ggplot2-scales-discrete
#' @export
#'
scale_fill_naruto_d<-function(name,direction=1,...){
  if(!requireNamespace("ggplot2",quietly = TRUE)){
    stop('ggplot2 is required for this functionality',call. = FALSE)
  }

  ggplot2::discrete_scale("fill",scale_name = name,
                          pal_pal(name=name,direction=direction),...)
}


#' Continuous scales to use for ggplot2
#'
#' These functions provide the option to use Naruto colours inside continuous
#' palettes with the `ggplot2` package.
#'
#'
#'
#' @param name
#' @param direction
#' @param ... Arguments to pass on to `ggplot2::scale_colour_gradientn` or
#'     `ggplot2::scale_fill_gradientn()`
#'
#' @return A `ScaleContinuous` object that can be added to a `ggplot` object
#' @export
#' @rdname  ggplot2-scales-continuous
#'
#' @inheritParams naruto_palette
#'
#' @examples
scale_colour_naruto_c<-function(name,direction=1,...){

  if(!requireNamespace("ggplot2",quietly = TRUE)){
    stop('ggplot2 is required for this functionality',call. = FALSE)
  }

  ggplot2::scale_colour_gradientn(
    colours = naruto_palette(name=name,direction=direction,
                             n=256,type="continuous",...)
  )
}


scale_color_naruto_c<-scale_colour_naruto_c

#' Continuous scales to use for ggplot2
#'
#' @param name
#' @param direction
#' @param ...
#'
#' @return
#' @export
#'
#' @examples
scale_fill_naruto_c<-function(name,direction=1,...){
  if(!requireNamespace("ggplot2",quietly = TRUE)){
    stop('ggplot2 is required for this functionality',call. = FALSE)
  }

  ggplot2::scale_fill_gradientn(
    colours = naruto_palette(name=name,direction=direction,
                             n=256,type="continuous")
  )
}
