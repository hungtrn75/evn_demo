import 'package:auto_route/auto_route.dart';
import 'package:collect_data/models/power_poles.dart';
import 'package:collect_data/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class FormPage extends StatefulWidget {
  final PowerPoles powerPoles;

  const FormPage({Key? key, required this.powerPoles}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormBuilderState>();

  void _onSubmit() async {
    _formKey.currentState!.save();
    if (_formKey.currentState!.validate()) {
      widget.powerPoles.elevation = _formKey.currentState!.value["elevation"];
      widget.powerPoles.property = _formKey.currentState!.value["property"];
      widget.powerPoles.save();
      context.router.pop(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.powerPoles.elevation != null;
    return Scaffold(
      appBar: AppBar(
        title: Text(isEdit ? "Cập nhật thông tin" : "Thêm mới thông tin"),
      ),
      body: FormBuilder(
        key: _formKey,
        autovalidateMode: AutovalidateMode.disabled,
        initialValue: {
          "elevation": widget.powerPoles.elevation,
          "property": widget.powerPoles.property,
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FormBuilderTextField(
                name: "elevation",
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Độ cao",
                  prefixIcon: Icon(Icons.keyboard_double_arrow_up_rounded),
                  suffixText: "mét",
                ),
                keyboardType: TextInputType.number,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.numeric(),
                ]),
              ),
              const SizedBox(
                height: 10.0,
              ),
              FormBuilderTextField(
                name: "property",
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Trị số tiếp địa",
                  prefixIcon: Icon(Icons.numbers),
                ),
                keyboardType: TextInputType.text,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
              ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                width: double.infinity,
                height: 46,
                child: ElevatedButton(
                  onPressed: _onSubmit,
                  child: Text(
                    isEdit ? "Cập nhật" : "Thêm mới",
                    style:
                        context.textTheme.button!.copyWith(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
