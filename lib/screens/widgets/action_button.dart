import 'package:flutter/material.dart';
import 'package:notes_app/utils/colors.dart';

actionButton(BuildContext context,{
  required String text,
  required VoidCallback onTap
}){
  return  Container(
            margin: EdgeInsets.only(
              top: 10,
              bottom: 10,
              right: 15,
              left: 0
            ),
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color:c4,
              borderRadius: BorderRadius.circular(12)
            ),
            alignment: Alignment.center,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onTap,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 15
                  ),
                  child: Text('Save',style: TextStyle(color: Colors.white),),
                ),
              ),
            ),
          );
}