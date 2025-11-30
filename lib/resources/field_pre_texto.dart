// ignore_for_file: must_be_immutable

import 'package:com/resources/toCurrency.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



class FieldTexto extends StatelessWidget {
  final TextEditingController controller = TextEditingController();
  final int? flex;
  final String label;
  final String initialValue;
  final void Function(String value) asignarValor;
  //opcionales
  final Iterable<String> opciones;
  final Color? color;
  final Color? colorfondo;
  final String? errorText;
  final bool tachado;
  final bool edit;
  final bool isCurrency;
  final int size;
  bool isNumber;
  FieldTexto({
    Key? key,
    required this.flex,
    required this.label,
    required this.initialValue,
    required this.asignarValor,
    this.color,
    this.isNumber = false,
    this.isCurrency = false,
    this.opciones = const [],
    this.colorfondo = Colors.transparent,
    this.tachado = false,
    this.edit = false,
    this.errorText,
    this.size = 22,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    isNumber = !isNumber ? isCurrency : isNumber;
    controller.text = initialValue;
    bool isSizedBox = flex == null;
    if (edit) {
      if (isSizedBox) {
        return SizedBox(height: size.toDouble(), child: _editField());
      }
      return Expanded(flex: flex!, child: _editField());
    }
    if (isSizedBox) {
      return SizedBox(height: size.toDouble(), child: _readField());
    }
    return Expanded(flex: flex!, child: _readField());
  }

  Autocomplete<String> _editField() {
    return Autocomplete<String>(
      displayStringForOption: (option) {
        return option;
      },
      optionsBuilder: (textEditingValue) {
        var optionsX = opciones
            .toSet()
            .where((e) =>
                e.toLowerCase().contains(textEditingValue.text.toLowerCase()))
            .toList();
        // optionsX.sort((a, b) => a.compareTo(b));
        return optionsX;
      },
      optionsViewBuilder: (context, onSelected, options) {
        return Material(
          child: ListView.builder(
            itemCount: options.length,
            itemBuilder: (context, i) {
              String option = options.toList()[i];
              return ListTile(
                title: Text(option, style: const TextStyle(fontSize: 14)),
                onTap: () {
                  onSelected(options.toList()[i]);
                  asignarValor(options.toList()[i]);
                },
              );
            },
          ),
        );
      },
      fieldViewBuilder:
          (context, textEditingController, focusNode, onFieldSubmitted) {
        // if (initialValue != null) {
        textEditingController.value = textEditingController.value.copyWith(
          text: initialValue,
          selection: TextSelection.collapsed(offset: initialValue.length),
        );
        // }
        if (isCurrency) {
          textEditingController.value = textEditingController.value.copyWith(
            text: toCurrency(initialValue),
            selection: TextSelection.collapsed(
                offset: toCurrency(initialValue).length),
          );
        }

        return TextField(
          textAlignVertical: TextAlignVertical.center,
          // textAlign: TextAlign.center,
          scrollPadding: const EdgeInsets.all(0),
          controller: textEditingController, // Required by autocomplete
          focusNode: focusNode, // Required by autocomplete
          inputFormatters:
              isNumber ? [FilteringTextInputFormatter.digitsOnly] : null,
          textAlign: isNumber ? TextAlign.end : TextAlign.center,
          onChanged: (value) {
            asignarValor(value);
          },
          decoration: InputDecoration(
            isDense: true,
            filled: true,
            fillColor: colorfondo,
            contentPadding:
                EdgeInsets.fromLTRB(size / 5, size / 5, size / 5, size / 5),
// contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            labelText: label,
            border: const OutlineInputBorder(),
            enabledBorder: color == null
                ? null
                : OutlineInputBorder(
                    borderSide: BorderSide(
                      color: color!,
                    ),
                  ),
            errorText: errorText,
            focusedBorder: color == null
                ? null
                : OutlineInputBorder(
                    borderSide: BorderSide(
                      color: color!,
                      width: 2,
                    ),
                  ),
          ),
          style: TextStyle(
            fontSize: (size - 5).toDouble(),
            decoration: tachado ? TextDecoration.lineThrough : null,
            
          ),
          
        );
      },
    );
  }

  Widget _readField() {
    return TextFormField(
      textAlign: TextAlign.center,
      textAlignVertical: TextAlignVertical.center,
      scrollPadding: const EdgeInsets.all(0),
      controller: controller,
      onChanged: (value) {
        controller.text = initialValue;
      },
      decoration: InputDecoration(
        isDense: true,
        filled: true,
        fillColor: colorfondo,
        // contentPadding: EdgeInsets.fromLTRB(0, (size + 6).toDouble(), 0, 0),
        contentPadding: EdgeInsets.fromLTRB(0, size / 2, 0, size / 2),
        labelText: label,
        border: const OutlineInputBorder(),
        enabledBorder: color == null
            ? null
            : OutlineInputBorder(
                borderSide: BorderSide(color: color!),
              ),
        focusedBorder: color == null
            ? null
            : OutlineInputBorder(
                borderSide: BorderSide(
                  color: color!,
                  width: 2,
                ),
              ),
      ),
      style: TextStyle(
        fontSize: (size - 5).toDouble(),
        decoration: tachado ? TextDecoration.lineThrough : null,
      ),
    );
  }
}
