import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'carregando_model.dart';
export 'carregando_model.dart';

class CarregandoWidget extends StatefulWidget {
  const CarregandoWidget({super.key});

  @override
  State<CarregandoWidget> createState() => _CarregandoWidgetState();
}

class _CarregandoWidgetState extends State<CarregandoWidget> {
  late CarregandoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CarregandoModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Align(
          alignment: const AlignmentDirectional(0.0, 0.0),
          child: Container(
            width: 50.0,
            height: 50.0,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              'assets/images/gif_carregando.gif',
              fit: BoxFit.scaleDown,
              alignment: const Alignment(0.0, 0.0),
            ),
          ),
        ),
      ],
    );
  }
}
