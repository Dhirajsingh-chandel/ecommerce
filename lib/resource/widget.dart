import 'package:flutter/material.dart';

class RoundedBtn extends StatelessWidget {
  final Widget? text;
  final bool? loading;
  final Color? colors;
  final double? height;
  final double? width;
  final VoidCallback? onPress;

  const RoundedBtn(
      {Key? key,
       this.colors,
       this.width,
       this.height,
       this.text,
      this.loading = false,
       this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: colors, borderRadius: BorderRadius.circular(40)),
        child: Center(child: text),
      ),
    );
  }
}

/// Text Field
class CustomTextField extends StatelessWidget {
  final String? text;
  final bool? loading;
  final Color? colors;
  final double? height;
  final double? width;
  final bool? read;
  final bool? readOnly;
  final String? hint;
  final VoidCallback callback;
  final bool? enabled;
  final TextEditingController? textEditingController;

  const CustomTextField(
      {Key? key,
      this.text,
      this.loading,
      this.colors,
      this.height,
      this.width = 300,
      this.textEditingController,
      this.read,
      this.hint,
      required this.callback,
      this.enabled,
      this.readOnly})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextFormField(
        enabled: enabled,
        controller: textEditingController,
        autofocus: false,
        decoration: InputDecoration(
          labelText: text,
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
        ),
      ),
    );
  }
}



class Button extends StatelessWidget {
  final Widget? text;
  final bool? loading;
  final Color? colors;
  final double? height;
  final double? width;
  final VoidCallback? onPress;

  const Button({Key? key, this.width, this.height,this.text, this.loading, this.colors, this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: colors, borderRadius: BorderRadius.circular(15)),
        child: Center(child: text),
      ),
    );
  }
}
