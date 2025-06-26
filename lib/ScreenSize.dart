import 'package:flutter/material.dart';

ScreenSize(width, height,{offset=0.0,dimesionFlip=false}){
  double Width=width;
  double Height=height;
  if(!dimesionFlip && width>height){
    Width=(width/100)*25;
    Height=height-8;
  }
  else if(!dimesionFlip){
    Width=width-7;
    Height=(height/100)*25;
  }

  if(dimesionFlip && width>height){
    Height=height;
    Width=offset;
  }
  else if(width<height && dimesionFlip){
    Width=width;
    Height=offset;
  }
  return [Width,Height];
}

