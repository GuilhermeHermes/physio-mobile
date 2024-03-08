import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'profile_page_widget.dart';
import 'professionalCard_page_widget.dart';

import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    Widget buildListView(String? value) {
      if (value == 'Nutricionista') {
        return ListView(
          padding: EdgeInsets.zero,
          primary: false,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: [
            _buildItem(
              context,
              'José Mourinho',
              'Nutricionista mestrando em nutrição esportiva. 5 anos de experiência...',
              'assets/images/profile_icon.jpg',
            ),
            _buildItem(
              context,
              'Gabriela Barros',
              'Nutricionista especializada em tratamento de doenças como desnutrição, bulimia, etc..',
              'assets/images/profile_icon.jpg',
            ),
          ],
        );
      } else if (value == 'Fisioterapeuta') {
        return ListView(
          padding: EdgeInsets.zero,
          primary: false,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: [
            _buildItem(
              context,
              'Caio Rodrigo',
              'Fisioterapeuta especializado em reabilitação muscular. 8 anos de experiência...',
              'assets/images/profile_icon.jpg',
            ),
            _buildItem(
              context,
              'Amanda Juliane',
              'Fisioterapeuta com foco em recuperação pós-cirúrgica. 10 anos de experiência...',
              'assets/images/profile_icon.jpg',
            ),
          ],
        );
      } else if (value == 'Personal') {
        return ListView(
          padding: EdgeInsets.zero,
          primary: false,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: [
            _buildItem(
              context,
              'Carlos Alberto',
              'Personal especializada em dietas para atletas. 6 anos de experiência...',
              'assets/images/profile_icon.jpg',
            ),
            _buildItem(
              context,
              'Jason Derulo',
              'Personal com ênfase em musculação para basquete. 7 anos de experiência...',
              'assets/images/profile_icon.jpg',
            ),
          ],
        );
      } else {
        return Container();
      }
    }

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFF1D2428),
        appBar: AppBar(
          backgroundColor: Color(0xFF1D2428),
          automaticallyImplyLeading: false,
          leading: Align(
            alignment: AlignmentDirectional(0.00, 0.00),
            child: Text(
              'Home',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Readex Pro',
                    fontSize: 19,
                    color: FlutterFlowTheme.of(context).primaryBtnText,
                  ),
            ),
          ),
          title: Align(
            alignment: AlignmentDirectional(1.40, 0.00),
            child: Text(
              'John Doe',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Outfit',
                    color: FlutterFlowTheme.of(context).primaryBtnText,
                    fontSize: 22,
                  ),
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
              child: Container(
                width: 60,
                height: 60,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: SizedBox(
                  width: 100, // Defina a largura desejada
                  height: 100, // Defina a altura desejada
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: Image.asset('assets/images/profile_icon.jpg'),
                  ),
                ),
              ),
            ),
          ],
          centerTitle: false,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(20, 24, 27, 1),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4,
                        color: Color(0x411D2429),
                        offset: Offset(0, 2),
                      )
                    ],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 16),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Good Morning,',
                          style: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .override(
                                  fontFamily: 'Roboto',
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBtnText),
                        ),
                        Text(
                          'Resumo',
                          style: FlutterFlowTheme.of(context)
                              .titleMedium
                              .override(
                                fontFamily: 'Roboto',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                              ),
                        ),
                        Divider(
                          height: 24,
                          thickness: 2,
                          color: FlutterFlowTheme.of(context).lineColor,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Consultas hoje',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                            fontFamily: 'Roboto',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBtnText),
                                  ),
                                  Text(
                                    '2',
                                    style: FlutterFlowTheme.of(context)
                                        .displaySmall
                                        .override(
                                          fontFamily: 'Roboto',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBtnText,
                                          fontWeight: FontWeight.w300,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Avg. Rating',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                            fontFamily: 'Roboto',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBtnText),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        '4.6',
                                        style: FlutterFlowTheme.of(context)
                                            .displaySmall
                                            .override(
                                                fontFamily: 'Outfit',
                                                fontWeight: FontWeight.w300,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBtnText),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            4, 0, 0, 0),
                                        child: Icon(
                                          Icons.star_rounded,
                                          color: Color(0xFF0894B3),
                                          size: 24,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.00, 0.00),
                child: FlutterFlowChoiceChips(
                  options: [
                    ChipData('Nutricionista'),
                    ChipData('Fisioterapeuta'),
                    ChipData('Personal')
                  ],
                  onChanged: (val) =>
                      setState(() => _model.choiceChipsValue = val?.first),
                  selectedChipStyle: ChipStyle(
                    backgroundColor: Color(0xFF0894B3),
                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          color: FlutterFlowTheme.of(context).primaryText,
                        ),
                    iconColor: FlutterFlowTheme.of(context).primaryText,
                    iconSize: 18,
                    elevation: 4,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  unselectedChipStyle: ChipStyle(
                    backgroundColor: FlutterFlowTheme.of(context).alternate,
                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          color: FlutterFlowTheme.of(context).secondaryText,
                        ),
                    iconColor: FlutterFlowTheme.of(context).secondaryText,
                    iconSize: 18,
                    elevation: 0,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  chipSpacing: 12,
                  rowSpacing: 12,
                  multiselect: false,
                  initialized: _model.choiceChipsValue != null,
                  alignment: WrapAlignment.start,
                  controller: _model.choiceChipsValueController ??=
                      FormFieldController<List<String>>(
                    ['Fisioterapeuta'],
                  ),
                ),
              ),
              buildListView(_model.choiceChipsValue),
              Divider(
                thickness: 1,
                color: FlutterFlowTheme.of(context).lineColor,
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 12, 0, 0),
                child: Text(
                  'Suas últimas consultas',
                  style: FlutterFlowTheme.of(context).titleMedium.override(
                        fontFamily: 'Readex Pro',
                        color: FlutterFlowTheme.of(context).secondaryText,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 44),
                child: ListView(
                  padding: EdgeInsets.zero,
                  primary: false,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: [
                    _buildItem(
                      context,
                      'Jorjão',
                      'Doutor em nutrição, 10 anos na área.',
                      'assets/images/profile_icon.jpg',
                    ),
                    _buildItem(
                      context,
                      'Lara Juliane',
                      'Especialista em nutrição vegana.',
                      'assets/images/profile_icon.jpg',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildItem(
  BuildContext context,
  String title,
  String description,
  String imagePath,
) {
  return GestureDetector(
    onTap: () {
      // Função padrão, por exemplo, navegar para ProfessionalCardPageWidget
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProfessionalCardPageWidget(
            name: title,
            description: description,
          ),
        ),
      );
    },
    child: Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 100,
        decoration: BoxDecoration(
          color: Color.fromRGBO(20, 24, 27, 1),
          boxShadow: [
            BoxShadow(
              blurRadius: 3,
              color: Color(0x411D2429),
              offset: Offset(0, 1),
            ),
          ],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 1, 1, 1),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    imagePath,
                    width: 70,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8, 0, 4, 0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: FlutterFlowTheme.of(context)
                              .titleLarge
                              .override(
                                fontFamily: 'Roboto',
                                color:
                                    FlutterFlowTheme.of(context).primaryBtnText,
                              ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 4, 8, 0),
                          child: AutoSizeText(
                            description,
                            textAlign: TextAlign.start,
                            style:
                                FlutterFlowTheme.of(context).bodySmall.override(
                                      fontFamily: 'Readex Pro',
                                      fontSize: 12,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBtnText,
                                    ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                    child: Icon(
                      Icons.chevron_right_rounded,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 24,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 4, 8),
                    child: Text(
                      '2m',
                      textAlign: TextAlign.end,
                      style: FlutterFlowTheme.of(context).bodySmall,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
