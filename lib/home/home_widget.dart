import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_model.dart';
export 'home_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late HomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: SafeArea(
          top: true,
          child: FutureBuilder<ApiCallResponse>(
            future: TopStoriesCall.call(),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                );
              }
              final seTopStoriesResponse = snapshot.data!;

              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 432.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Container(
                                height: 50.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  borderRadius: BorderRadius.circular(25.0),
                                  border: Border.all(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    width: 1.0,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 12.0, 0.0, 12.0),
                                  child: FutureBuilder<ApiCallResponse>(
                                    future: TopStoriesCall.call(),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      final rowTopStoriesResponse =
                                          snapshot.data!;

                                      return Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Icon(
                                            Icons.search,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24.0,
                                          ),
                                          Expanded(
                                            child:
                                                FutureBuilder<ApiCallResponse>(
                                              future: TopStoriesCall.call(),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      child:
                                                          CircularProgressIndicator(
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                                Color>(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }
                                                final textFieldTopStoriesResponse =
                                                    snapshot.data!;

                                                return TextFormField(
                                                  controller:
                                                      _model.textController,
                                                  focusNode:
                                                      _model.textFieldFocusNode,
                                                  autofocus: false,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    hintText: 'Search...',
                                                    hintStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                                    enabledBorder:
                                                        InputBorder.none,
                                                    focusedBorder:
                                                        InputBorder.none,
                                                    errorBorder:
                                                        InputBorder.none,
                                                    focusedErrorBorder:
                                                        InputBorder.none,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                                  minLines: 1,
                                                  validator: _model
                                                      .textControllerValidator
                                                      .asValidator(context),
                                                );
                                              },
                                            ),
                                          ),
                                        ].divide(SizedBox(width: 8.0)),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                            FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 23.0,
                              buttonSize: 46.0,
                              fillColor: FlutterFlowTheme.of(context).primary,
                              icon: Icon(
                                Icons.tune_rounded,
                                color: FlutterFlowTheme.of(context).info,
                                size: 24.0,
                              ),
                              onPressed: () {
                                print('IconButton pressed ...');
                              },
                            ),
                          ].divide(SizedBox(width: 12.0)),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      child: Material(
                        color: Colors.transparent,
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0.0),
                                      bottomRight: Radius.circular(0.0),
                                      topLeft: Radius.circular(16.0),
                                      topRight: Radius.circular(16.0),
                                    ),
                                    child: Image.asset(
                                      'assets/images/istockphoto-865700152-612x612.jpg',
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height: 200.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: Text(
                                    'major counterfeit and narcotic racket busted',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: Color(0xFF101518),
                                          fontSize: 24.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: Text(
                                    'kolkata,nov 14,in a major joint operation by the special task force of bengal police has busted two major cross boarder rackets of counterfiets currency and narcotics',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: Color(0xFF57636C),
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ),
                              ].divide(SizedBox(height: 12.0)),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      child: Material(
                        color: Colors.transparent,
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0.0),
                                      bottomRight: Radius.circular(0.0),
                                      topLeft: Radius.circular(16.0),
                                      topRight: Radius.circular(16.0),
                                    ),
                                    child: Image.asset(
                                      'assets/images/585648443863ae9551c881224a1bf42a3ac9b4a31152a93e2b93393da7ae71d8.jpg',
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height: 200.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: Text(
                                    'Iran-Israel war: Big worry for Israel as Iran looks to acquire Chinese J-10 fighter jet; Check this deadly warplane\'s capabilities, power',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: Color(0xFF101518),
                                          fontSize: 24.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: Text(
                                    'Iran-Israel War: Amidst the looming threat of a full-blown war with Israel, Iran is looking bolster its aerial offense capabilities to compliment its already stellar missile systems.\n\nIranian Air Force Commander-in-Chief Brigadier General Hamid Vahedi recently attended a military exhibition in China, during which he reportedly examined J-10C fighter jet.\n\nThe Iran Air Force chief inspected the Chengdu J-10C Vigorous Dragon, and witnessed its impressive capabilities during the Zhuhai Air Show on November 12, according to a report by Eurasian Times. Vahedi also tested fighter jet\'s features and discussed possible areas of cooperation between Iranian and Chinese air forces with his Chinese counterpart General Chang Dingqiu, the report said.\n\nWhy Iran needs the Chinese J-10C fighter jet?\n\nAlthough Iran possesses strong missile offensive systems, boasting missiles of different technological levels and speeds, the Islamic Republic, unlike its arch nemesis Israel, lacks a potent air force. The addition of J-10 fighter planes would bolster the offensive capabilities of Iranian Air Force, giving it at least a fighting chance against the Israeli Air Force, who are more battle-hardened and equipped with F-35s and other advanced warplanes.',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: Color(0xFF57636C),
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ),
                              ].divide(SizedBox(height: 12.0)),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      child: Material(
                        color: Colors.transparent,
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0.0),
                                      bottomRight: Radius.circular(0.0),
                                      topLeft: Radius.circular(16.0),
                                      topRight: Radius.circular(16.0),
                                    ),
                                    child: Image.asset(
                                      'assets/images/7fe1319bb2e4a72f320205cdeacac725e73f1e1f6de5a063c7d9781bd7bfefee.jpg',
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height: 200.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: Text(
                                    'Fans spotted climbing trees to catch a glimpse of Virat Kohli in the India nets in Perth',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: Color(0xFF101518),
                                          fontSize: 24.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: Text(
                                    'As Virat Kohli started preparations for the upcoming Border Gavaskar Trophy, a few fans were spotted climbing nearby trees to watch him play.\n\nIt shows Kohli\'s craze and popularity as fans are always eager to get a glimpse, even if they require going out of their way.\n\nThe Indian team is practising in Perth away from the public eye as the ground is covered with black sheets to block the view of spectators. However, even these sheets couldn\'t stop them from finding ways; fans risked their well-being and climbed on trees, allowing them to get a rough idea of what was happening in the practice session.\n\nThose fans also sounded confident of India\'s chances in the impending Border Gavaskar Trophy, with one of them predicting a whitewash over Australia. They were also sure that Virat Kohli, who hasn\'t been in fine form lately, will regain his lost touch and score heavily in the five-match Test series.\n\nList of Highest Partnerships in Ranji Trophy: Snehal Kauthankar and Kashyap Bakle Set New Record of 606 Runs\n\nHowever, as visible in the video posted by Fox Cricket, he was slightly uncomfortable against Jasprit Bumrah in the nets. He will face similar challenges in the coming week, for the pitch in Perth will be spicy and significantly aid fast bowlers.',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: Color(0xFF57636C),
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ),
                              ].divide(SizedBox(height: 12.0)),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      child: Material(
                        color: Colors.transparent,
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0.0),
                                      bottomRight: Radius.circular(0.0),
                                      topLeft: Radius.circular(16.0),
                                      topRight: Radius.circular(16.0),
                                    ),
                                    child: Image.asset(
                                      'assets/images/77e64bd7b8d9b41fe35a47bddb81a3115522c8ab9ae94c009aac9ede5a2ce042.jpg',
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height: 200.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: Text(
                                    'Assam bypolls: Samaguri Cong candidate alleges rigging by BJP, demands repolling',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: Color(0xFF101518),
                                          fontSize: 24.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: Text(
                                    'Guwahati: Congress candidate for Samaguri constituency Tanzil Hussain on Thursday alleged that the ruling BJP indulged in \'booth capturing, rigging, coercion and undue influence\' during the by-elections a day ago.\n\n\nFiling a complaint with the returning officer of the constituency, Hussain demanded repoll in 33 polling stations, which were “captured and rigged” in the interest of free and fair elections.\n\n“There were booth capturing, rigging, coercion, undue influence on the polling day in 88 No Samaguri Legislative Assembly Constituency (LAC) by the goons, miscreants, workers and supporters of BJP,” he said.\n\nHussain alleged that BJP MLAs Jitu Goswami and Rupak Sharma along with their companions visited several booths without any authority in complete violation of the guidelines by the Election Commission of India (ECI).\n\nHe then listed out 17 voting stations, from where Congress polling agents were allegedly driven out and the booths were captured and rigged.\n\nThe candidate also named seven booths, which were allegedly visited by Goswami and threatened Congress workers, supporters and voters.\n\nOn the other hand, Sharma illegally entered two booths and threatened Congress agents, the complaint stated.\n\nHussain further alleged that his opponent from the BJP, Diplu Ranjan Sarma, manhandled and threatened Congress agents, and rigged voting at six polling stations.\n\nThe Congress candidate also said that party workers were “illegally detained” from one polling station by an Additional Superintendent of Police-rank officer.\n\n“Therefore, re-polling is required to be ordered in the aforesaid polling booths which were captured and rigged in the interest of free and fair election,” he added.\n\nBypolls took place in Dholai (SC), Sidli (ST), Bongaigaon, Behali and Samaguri assembly constituencies as these seats fell vacant with the representatives of them winning the recent Lok Sabha elections.',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: Color(0xFF57636C),
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ),
                              ].divide(SizedBox(height: 12.0)),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      child: Material(
                        color: Colors.transparent,
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0.0),
                                      bottomRight: Radius.circular(0.0),
                                      topLeft: Radius.circular(16.0),
                                      topRight: Radius.circular(16.0),
                                    ),
                                    child: Image.asset(
                                      'assets/images/22367968576fead221a0d86b02cadbf61b5c9088bc3fde63e66d188488ebcbc6.jpg',
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height: 200.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed('Home');
                                    },
                                    child: Text(
                                      'What Causes Random Bruising? Possible Underlying Health Conditions',
                                      style: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: Color(0xFF101518),
                                            fontSize: 24.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: Text(
                                    'If you are noticing unexplained bruises on your body without any known injury-perhaps a large bruise on your elbow or knee when you wake up in the morning-it\'s important not to ignore it.\n\nIn some cases, recurring bruising may be a sign of an underlying health issue.\n\nHere are some potential causes for unexplained or frequent bruising:\n\n1. Vasculitis (Inflammation of Blood Vessels)\n\nVasculitis is an autoimmune condition where the blood vessels become inflamed, which can result in bruising. The inflammation can affect blood flow, causing capillaries to break and blood to leak into the skin. This can lead to spontaneous bruising, especially without any trauma.\n\n2. Hemophilia\n\nHemophilia is a genetic disorder that affects the blood\'s ability to clot. People with hemophilia may experience prolonged bleeding and bruising, even from minor bumps or injuries. Since the blood doesn\'t clot properly, bruising can occur easily in various parts of the body.',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: Color(0xFF57636C),
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ),
                              ].divide(SizedBox(height: 12.0)),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      child: Material(
                        color: Colors.transparent,
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0.0),
                                      bottomRight: Radius.circular(0.0),
                                      topLeft: Radius.circular(16.0),
                                      topRight: Radius.circular(16.0),
                                    ),
                                    child: Image.asset(
                                      'assets/images/95002ddde6009f0bda656ad2d7310d1d829642050effa4cf62d849e14a26a7ee.jpg',
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height: 200.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: Text(
                                    'Maharashtra: Congress leader Kanhaiya Kumar makes sexist comments targeting DY CM Devendra Fadnvis\' wife Amruta, party defends him',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: Color(0xFF101518),
                                          fontSize: 24.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: Text(
                                    'On Wednesday, 13th November, Congress leader Kanhaiya Kumar made derogatory and alleged sexist remarks against Dy CM Devendra Fadnavis\'s wife as he addressed a rally in the Nagpur district of Maharashtra ahead of the polls.\n\nKanhaiya accused Fadnavis of spreading divisive discourse and questioned why the public ought to be responsible for saving religion while his wife could be busy making Instagram reels.\n\nThe statement was aimed at Fadnavis, who is contesting for the Nagpur Southwest constituency. The former Chief Minister is up against Congress candidate Prafulla Gudadhe. Kanhaiya Kumar, without specifically naming Amruta Fadnavis, targeted her for being extremely active on social media.\n\n“If this is a ‘dharma yudh’ (religious war), then question any leader who gives you speeches about saving religion. Ask them if the leader’s own sons and daughters will also join in the fight to save religion. How is it possible that the public saves religion while the leader’s children study abroad? How can the public be responsible for saving religion, while the Deputy Chief Minister’s wife makes Instagram reels?” Kanhaiya Kumar said indicating that former CM’s wife or family members of BJP leaders didn’t work to save religion.\n\nBJP took cognizance of the event and slammed the Congress party for being a hypocrite. BJP spokesperson Shehzad Poonawalla commented on the event and slammed Kanhaiya Kumar for insulting Amruta Fadnavis. He said that on the one hand Congress believes in ‘Ladki hu lad sakti hu (I am a woman and I can fight) and on the other hand, they insult women.',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: Color(0xFF57636C),
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ),
                              ].divide(SizedBox(height: 12.0)),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      child: Material(
                        color: Colors.transparent,
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      child: Material(
                        color: Colors.transparent,
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0.0),
                                      bottomRight: Radius.circular(0.0),
                                      topLeft: Radius.circular(16.0),
                                      topRight: Radius.circular(16.0),
                                    ),
                                    child: Image.asset(
                                      'assets/images/71109988e828f613b3523f8eec9178bc73087de67db6f6f3315b8c0dfcbe85b4.jpg',
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height: 200.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: Text(
                                    'Weeks after Ratan Tata\'s death, this Tata company sold to TSI for Rs 300000000 due to...',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: Color(0xFF101518),
                                          fontSize: 24.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: Text(
                                    'Once led by Ratan Tata, now under the huge empire of Noel Tata, Tata Communications has entered into a share purchase agreement with Transaction Solutions International India (TSI India) for sale of its entire stake in wholly owned subsidiary Tata Communications Payment Solutions, in a deal worth over Rs 330 crore.\n\n\nTata Communications Payment Solutions (TCPSL) is a company incorporated in India and registered as a White Label ATM Operator with the Reserve Bank of India (RBI).\n\nThe proposed transaction is subject to completion of the conditions stipulated under the share purchase agreement (SPA), including regulatory and other nods from the RBI and any other authority as may be necessary, according to a BSE filing.\n\nThe transaction is expected to be completed by the end of the fourth quarter of FY25.\n\nTata Communications Subsidiary Acquired By TSI India\n\nAs per a release accompanying the filing, Transaction Solutions International India(TSI) -- a majority-owned subsidiary of Australian digital payments and financial services provider Findi -- announced that it has entered into a share purchase agreement to acquire 100 per cent stake in TCPSL, a wholly owned subsidiary of Tata Communications.\n\n\"The deal has been signed for a total amount comprising of Rs 330 crore (AUD 59.1 million), an additional amount reflecting the interchange rate adjustment specified in the SPA, which is estimated to be up to Rs 75 crore (AUD 13.4 million) and is subject to customary adjustments as specified in the SPA,\" the release said.\n\nThe deal is in line with TSI\'s strategic growth plan to deliver the full suite of financial service solutions to India\'s underbanked and accelerate its own transformation into a full-fledged payments bank.\n\nTSI Business Profile\n\nLaunched in 2005, TSI operates a brown-label ATM business, partnering with 12 public and private sector banks (including State Bank of India, Central Bank of India, Punjab National Bank, and HDFC Bank), and has experience of managing backend perations for 10,000-plus white label ATMs (WLA) over the last eight years. It also enables payment services through its network of over 40,000 merchants via the brand FindiPay (started in 2018).\n\nTCPSL -- established in 2008 -- has been a part of Tata Communications\' broader portfolio. In 2013, TCPSL unveiled Indicash, India\'s first-ever network of white label ATMs. Today, TCPSL owns and manages one of the largest networks of white-label ATMs in the country.\n\nIn addition to delivering over 4,600 operating Indicash ATMs to TSI\'s existing network of 7,500 plus brown label ATMs in India, this proposed acquisition by TSI will provide it with a white label ATM platform with a WLA licence, payments switch, and an additional 3,000 ATMs to be deployed -- providing it with additional scale.\n\nIt will also enable TSI to deploy white label ATMs into its FindiPay merchant outlets, driving product and service innovation across the FindiPay business and delivering market-leading customer experiences.\n\nTSI MD and CEO Deepak Verma said, \"TCPSL\'s existing and upcoming ATMs significantly improve our penetration, especially in rural areas. The addition of payment switch capability enhances our service delivery, enabling us to deliver cash and related financial services seamlessly.\"\n\nVerma added, \"We foresee strong synergies between white label ATMs and our existing FindiPay merchant network, empowering our merchants to expand their services and better serve underbanked communities\".\n\n\"The payments solutions sector, a non-core business, operates under different dynamics compared with our traditional or primary offerings. This strategic step will allow us to double down on our core areas of expertise that align with our long-term objectives, while unlocking value and improving profitability,\" Tata Communications CFO Kabir Ahmed Shakir said.',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: Color(0xFF57636C),
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ),
                              ].divide(SizedBox(height: 12.0)),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      child: Material(
                        color: Colors.transparent,
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0.0),
                                      bottomRight: Radius.circular(0.0),
                                      topLeft: Radius.circular(16.0),
                                      topRight: Radius.circular(16.0),
                                    ),
                                    child: Image.asset(
                                      'assets/images/b9f79bc0d8ff1d5758abc20ab2b236bc336e860387b62efa98282963d413ddba.png',
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height: 200.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: Text(
                                    'The saga of Atiq Ahmed continues: \'Husband avenged\', SP MLA backs BJP candidate in UP bypoll',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: Color(0xFF101518),
                                          fontSize: 24.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: Text(
                                    'Samajwadi Party MLA Pooja Pal is endorsing BJP candidate Deepak Patel in the Phulpur bypoll. (Express photo by Vishal Srivastav)\n\nIN THE bypoll for the Phulpur Assembly seat, one of the nine constituencies in Uttar Pradesh which will vote on November 20, BJP candidate Deepak Patel has got an unexpected boost.\n\nFor the past few days, among those campaigning for him is Samajwadi Party MLA Pooja Pal.\n\nPal, the SP MLA from Chail in Kaushambi, which is around 60 km from Phulpur, told The Indian Express that her reason was personal, as it is the Yogi Adityanath-led BJP government in UP that had ensured \"justice\" in her husband Raju Pal\'s killing.\n\nThen a BSP MLA, Raju Pal\'s killing was orchestrated in January 2005 by mafia don-turned-politician Atiq Ahmed and his brother Ashraf. The two were shot down on camera last year, while leaving a hospital in police custody. Apart from the two who were prime accused, there were six others charged in the Raju Pal killing and they were sentenced to life imprisonment in March this year.\n\n\"It is my decision to campaign for the BJP candidate because under Chief Minister Adityanath, my community and I have received justice,\" Pooja Pal says, adding that her fight lasted over two decades. \"I am simply informing the people that I have now received justice.\"\n\nThe SP has had its reasons to keep an eye on Pal, whose name did the rounds after the party lost a seat due to cross-voting for the Rajya Sabha elections in February. But almost a week after she began canvassing for the BJP\'s Deepak Patel, SP media in-charge for Prayagraj Dan Bahadur Madhur claims he is unaware of the matter.\n\nExpressing confidence that SP Phulpur candidate Mujtaba Siddiqui, a former three-time BSP MLA (from Soraon, Pratappur), will win, Madhur told The Indian Express: \"People from all walks of life are supporting us. We are confident of winning.\"\n\nHowever, the BJP has been gaining ground in Phulpur. The bypoll itself was necessitated because its MLA from here for the past two times, Praveen Singh Patel, won this year\'s Lok Sabha elections.\n\nAsked about Pooja Pal supporting Deepak Patel, BJP Gangapar president Uttar Maurya did not directly confirm that she was campaigning for the party. \"She may be campaigning for the BJP candidate, but Pooja Pal has neither joined the BJP nor has attended party meetings,\" Maurya says.\n\nA total of 19 candidates are in the fray for the Phulpur bypoll, including the BSP\'s Jitendra Singh, a businessman and first-timer.\n\nThe seat, which has around 4.16 lakh voters, has predominantly Dalits, followed by Yadavs, Muslims and Brahmins (approximately 90,000; 70,000; 55,000; and 40,000, respectively). On paper, the SP candidate has an advantage, with Yadavs and Muslims a vote bank of the party, and Dalits potential supporters.\n\nHowever, if the BSP entry has queered the pitch, so has a Congress rebel. Following the Congress leadership\'s decision to not contest the bypolls, after the SP offered it only a couple of seats as part of their coalition, Congress leader Suresh Chandra Yadav filed his nomination from Phulpur as an Independent.\n\nBJP candidate Deepak Patel also has a link to Phulpur. Patel\'s mother Kesari Devi won the 2019 Lok Sabha elections from Phulpur. Deepak is a former MLA of the BSP from the Karachhana seat, who shifted to the BJP in 2018.\n\nPooja Pal does have an expectation as she lends her backing openly to the BJP. She says she recently learnt that the accused in Raju Pal\'s murder case have been transferred to Prayagraj Jail from Lucknow Jail due to pending cases in Prayagraj against them.\n\n\"If they remain in Prayagraj, it would pose a continuous threat to my life, as I was the complainant in the murder case. In a gangster case pending against them, I am a witness. I have decided to meet the CM to seek protection,\" she says.',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: Color(0xFF57636C),
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ),
                              ].divide(SizedBox(height: 12.0)),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      child: Material(
                        color: Colors.transparent,
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0.0),
                                      bottomRight: Radius.circular(0.0),
                                      topLeft: Radius.circular(16.0),
                                      topRight: Radius.circular(16.0),
                                    ),
                                    child: Image.asset(
                                      'assets/images/358a0dfe83e666a0b8c09fa572ccd2ccbd88e2e8fcbfb6ef9cde8f67900eec25.jpg',
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height: 200.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: Text(
                                    'Children\'s Day 2024: From Bebo to Deepika Padukone, Bollywood\'s cutest baby pics that will melt your heart',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: Color(0xFF101518),
                                          fontSize: 24.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: Text(
                                    'Children\'s Day 2024: From baby Deepika to little Kareena, childhood pics of Bollywood stars you need to see\n\nToday is Children\'s Day, and the world is buzzing with celebrations!\n\nWhile most Bollywood celebs are busy marking the day with their little ones, let\'s dive into the nostalgic charm of their childhood pictures-because, let\'s face it cause our hearts are forever young! From Ranbir Kapoor to Sonam Kapoor, here\'s a peek into some adorable Bollywood star baby photos that prove \"dil toh baccha hai ji\" (the heart is always young).\n\nDeepika Padukone\n\nThe newest mom in Bollywood once shared her childhood picture, and in this one, she\'s looking adorably cute. Her little hat? Absolutely the cherry on top!\n\nAlia Bhatt\n\nThe Darlings star is known for throwback photos, and this one with mom Soni melts hearts. Raha, you definitely got your cuteness from her!\n\n\nKatrina Kaif\n\nKatrina\'s charm was undeniable, even as a kid. This picture screams future superstar-so adorable, so innocent, a total \"wow\" moment.\n\n\nVicky Kaushal\n\nWe can\'t talk about Katrina without mentioning her hubby, Vicky Kaushal! His childhood pic radiates that same infectious energy he has now.\n\n\nAnushka Sharma\n\nHer smile hasn\'t changed a bit. Baby Anushka, with her wild curls and radiant smile, is pure joy-a total must-see!\n\n\nHrithik Roshan\n\nEven as a newborn, Hrithik was a stunner. Little Hrithik or teenage Hrithik-he\'s always been absolutely charming.\n\n\nKartik Aaryan\n\nKartik\'s childhood snap with two pigtails is giving all the relatable childhood vibes. Shocked expression? Same, Kartik, same!\n\n\nSiddharth Malhotra\n\nShershaah star Siddharth in his chunky watch and oversized tee was a Gen Z icon before it was cool. Confident and stylish!\n\n\nKiara Advani\n\nHer as a baby is giving the most precious vibes ever. I mean look at her, the innocence is literally lurking and her eyelashes OMG, its goals!!\n\n\nKareena Kapoor Khan\n\nTalking about childhood pictures of Bollywood celebs, if we miss Kareena then it\'s a crime. Cause listen up, she was the cutest Bollywood kid ever. You can argue with the wall.\n\n\nThese pictures are pure nostalgia, a sweet glimpse of Bollywood\'s now-superstars when they were just wide-eyed kids. Who would\'ve thought these cuties would one day be the faces ruling the industry?',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: Color(0xFF57636C),
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ),
                              ].divide(SizedBox(height: 12.0)),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      child: Material(
                        color: Colors.transparent,
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0.0),
                                      bottomRight: Radius.circular(0.0),
                                      topLeft: Radius.circular(16.0),
                                      topRight: Radius.circular(16.0),
                                    ),
                                    child: Image.asset(
                                      'assets/images/0afec72fa64cbf469b875762004607d5b9668eeec41c884dd0f67722fce3a8ea.jpg',
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height: 200.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: Text(
                                    '\'India playing in 2 sides of the world...\': Heinrich Klaasen\'s heartbreaking take on South African cricket\'s status',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: Color(0xFF101518),
                                          fontSize: 24.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: Text(
                                    'Heinrich Klaasen has lamented the fact that South Africa\'s T20I series against India consists of just four matches with the last one scheduled for Friday and said that this reflects on what the status of the country is at the moment in the sport.\n\nIndia took a 2-1 lead in the series after they won the third match at Centurion, which means that the most South Africa do on Friday is draw the rubber.\n\nKlaasen was asked by reporters after the match on Wednesday about what the Proteas thought about the fact that all they can do is draw the series in the final match. \"That\'s the nature of where we are in South African cricket,\" he said.\n\n\"We don\'t play any more five-match series. Our Test team are playing two-Test series, which is ridiculous. How nice would it be if we win on Friday, and Sunday is another game that we\'re going into at two-all?\"\n\nKlaasen said that South Africa would like to play more cricket and longer series against other international sides. \"It\'s disappointing and it doesn\'t sit well with the players because we want to play more cricket against these guys and other countries. But we always find a way to just play two or three games and it\'s annoying. Then you see India are playing on Friday in two different sides of the world,\" he said.\n\n\'Have to make sure we don\'t lose the series\'\n\nSouth Africa haven\'t played a Test series consisting of more than two matches since their 2022/23 tour of Australia. The last time they played more than three Tests was in December 2019 and January 2020, when they hosted England for four. Their most recent five-Test series was at home against England in December 2004 and January 2005. Only one of South Africa\'s last 16 bilateral ODI rubbers was of more than three games - against Australia at home in September 2023.',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: Color(0xFF57636C),
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ),
                              ].divide(SizedBox(height: 12.0)),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      child: Material(
                        color: Colors.transparent,
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      child: Material(
                        color: Colors.transparent,
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      child: Material(
                        color: Colors.transparent,
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      child: Material(
                        color: Colors.transparent,
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0.0),
                                      bottomRight: Radius.circular(0.0),
                                      topLeft: Radius.circular(16.0),
                                      topRight: Radius.circular(16.0),
                                    ),
                                    child: Image.asset(
                                      'assets/images/e4c1ab46c73ea6ab457c283461e547f68689d976c2c5b2e4c55f88cadf23d6d4.jpg',
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height: 200.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: Text(
                                    'This man earned more money than Mukesh Ambani and world\'s richest man Elon Musk in one day, he is...',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: Color(0xFF101518),
                                          fontSize: 24.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: Text(
                                    'Gautam Adani, Chairperson of the Adani Group, has become India\'s wealthiest individual, overtaking Reliance Industries\' chairman Mukesh Ambani, as reported by the Bloomberg Billionaires Index.\n\nAdani\'s net worth surged by \$13.3 billion, reaching \$97.6 billion, with an impressive single-day gain of \$7.67 billion on Thursday, surpassing Ambani\'s net worth of \$97.2 billion.\n\nA pivotal moment came on January 3, 2024, when a Supreme Court ruling in the Adani-Hindenburg case contributed significantly to Adani\'s wealth. Despite a dip in the domestic market, Adani Group shares mostly rose on Tuesday, with Adani\'s net worth climbing by \$1.63 billion to \$85.9 billion that day. According to the Bloomberg Billionaires Index, Adani earned more than any other billionaire on Tuesday, outpacing even Elon Musk.\n\nThe Supreme Court ruled against granting investigative rights to SEBI in the Adani-Hindenburg matter and decided not to transfer the investigation to the Securities Appellate Tribunal (SAT). The court found SEBI\'s investigation satisfactory, noting no irregularities in 22 of the 24 cases reviewed. SEBI was allowed three more months to investigate the remaining two cases. Following this ruling, the market capitalization of Adani Group\'s listed companies soared, increasing Gautam Adani\'s net worth by \$3.6 billion in a single day.\n\nIn comparison, Elon Musk, the wealthiest person on the Forbes Billionaires List with a net worth of \$244.1 billion, saw a \$7.1 billion drop, marking a 2.84% decline. Although Musk continues to lead globally, Adani\'s substantial single-day gains have established him as a significant global contender, impacting the rankings among the world\'s richest.',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: Color(0xFF57636C),
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ),
                              ].divide(SizedBox(height: 12.0)),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      child: Material(
                        color: Colors.transparent,
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0.0),
                                      bottomRight: Radius.circular(0.0),
                                      topLeft: Radius.circular(16.0),
                                      topRight: Radius.circular(16.0),
                                    ),
                                    child: Image.asset(
                                      'assets/images/9a0e935d1cd611f2f7563a900de2815a1413e40699641bdb8dbd11a7f096e648.jpg',
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height: 200.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: Text(
                                    'Big trouble for Israel as old enemies Iran and Saudi Arabia coming closer after mediation',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: Color(0xFF101518),
                                          fontSize: 24.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: Text(
                                    'Iran-Israel War: Iran and Saudi Arabia have been longtime rivals, with both nations trying to establish and assert its dominance in the Middle-East over the years.\n\nHowever, recently the two regional rivals seem to be on a path of reconciliation, with China-- which has cordial ties with both Iran and Saudi Arabia-- playing the role of a mediator and making efforts the bring the two nations together.\n\nSaudi Arabia and Iran, who share a longstanding rivalry in the Middle-East, mainly due to sectarian differences, have recently started coming closer, as was evident when Iran\'s Minister of Foreign Affairs, Abbas Araghchi, met Saudi Crown Prince Mohammed bin Salman last month.\n\nThe development comes amidst Israel\'s ongoing brutal military campaign in the Gaza Strip, which has killed over 45,000 civilians, including around 20,000 children, and its expansion of war into Lebanon and other parts of Middle-East. Israel\'s aggression, which has pushed the Middle-East to the brink of a regional war, is being seen as one of key drivers behind rekindling of Iran-Saudi ties, with China playing an important role in bringing the traditional rivals on the same platform and helping improve their relations, according to Ynet News.\n\nMBS condemns Israel\'s \'genocide\' in Gaza\n\nNotably, at the recent Arab-Islamic Summit in Saudi capital Riyadh, Crown Prince Mohammed bin Salman (MBS) denounced Israel\'s actions in Gaza as a \"genocide\".\n\nIn his opening remarks, MBS condemned Israel\'s actions in Gaza and its military operations in Lebanon, calling for an immediate cessation of hostilities in both regions. The Crown Prince said Israel was \"massacring\" the Palestinian and Lebanese people, while also denouncing the obstruction of humanitarian aid to Gaza and rejecting any attempts to undermine the Palestinian Authority\'s role in the region.\n\nWhy MBS is seeking closer ties with Iran?\n\nAccording to analysts, MBS is a farsighted strategist who thinks ahead for the future of Saudi Arabia, which he now believes is in peril due to Israel\'s aggression that may spark a full-scale regional war in the Middle East. Professor Farid, a Saudi academic, noted that the Crown Prince\'s condemnation of Israel\'s \'genocide\' in Gaza, send a clear message to the Jewish nation that the Muslim world will set aside its differences and unite against if it does not halt its war machine.\n\nThe warming up of Saudi-Iran ties began with the reopening of each other\'s embassies in Tehran and Riyadh, with China continuing to promote regional unity between the two Middle-Eastern powers.',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: Color(0xFF57636C),
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ),
                              ].divide(SizedBox(height: 12.0)),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      child: Material(
                        color: Colors.transparent,
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0.0),
                                      bottomRight: Radius.circular(0.0),
                                      topLeft: Radius.circular(16.0),
                                      topRight: Radius.circular(16.0),
                                    ),
                                    child: Image.asset(
                                      'assets/images/00f64b7dc7636800efa258c942828ebdf0ee52c38677e7ff432cb106df1a1d8f.jpg',
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height: 200.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: Text(
                                    'Tiny House Or Engineering Masterpiece? 2-Foot Wide Building Has Internet Divided',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: Color(0xFF101518),
                                          fontSize: 24.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: Text(
                                    'A video is circulating online showcasing a unique building appearing to be 2 feet wide including a shop below. The video has garnered widespread attention among the public and sparked curiosity.\n\n\nEveryone dreams of having a home of their own where they can live peacefully with their loved ones under a roof. But for many, this dream does not come true. Some people spend their entire lives in rented homes, while others manage to build a house on even the smallest piece of land. Some of these homes are so impressive, they leave people baffled. Similarly, the viral video showcases a house that is 2 feet wide from one side including shops below it. There is also a window AC installed in the house. However, it is difficult to guess by looking at the video how the engineer would have designed it, and how the people are residing in it.',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: Color(0xFF57636C),
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ),
                              ].divide(SizedBox(height: 12.0)),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      child: Material(
                        color: Colors.transparent,
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0.0),
                                      bottomRight: Radius.circular(0.0),
                                      topLeft: Radius.circular(16.0),
                                      topRight: Radius.circular(16.0),
                                    ),
                                    child: Image.asset(
                                      'assets/images/c105edc19a77ae425eca560c8492426cb9b3b56429696db03e1167d902d31950.png',
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height: 200.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: Text(
                                    '15-member Indian team finalized for ODI series against Bangladesh, Varun Chakraborty-Bhuvneshwar Kumar return after years',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: Color(0xFF101518),
                                          fontSize: 24.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: Text(
                                    'Bhuvneshwar Kumar may return to Team India\n\nLet us tell you that experienced fast bowler Bhuvneshwar Kumar may return for the series against Bangladesh.\n\nBhuvneshwar Kumar has been out of the team for a long time, but for this series, Team India can rest its main players, so he can be given a chance for this series. Bhuvneshwar was dropped from the team after the T20 World Cup in the year 2022.\n\nVarun can get a chance in Team India in ODIs\n\nAt the same time, spin bowler Varun Chakraborty, who made a comeback from T20 cricket this year against Bangladesh, can be given a chance in the team. Varun has bowled brilliantly after returning to the team, in view of which he can also be given a chance in ODIs.\n\nVarun recently took 5 wickets in the T20 match against South Africa, after which the team management was very impressed with his performance. This is the reason why he can now be given a chance in the ODI team.',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: Color(0xFF57636C),
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ),
                              ].divide(SizedBox(height: 12.0)),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      child: Material(
                        color: Colors.transparent,
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0.0),
                                      bottomRight: Radius.circular(0.0),
                                      topLeft: Radius.circular(16.0),
                                      topRight: Radius.circular(16.0),
                                    ),
                                    child: Image.asset(
                                      'assets/images/be2738012a371b6de6fb1f65710fe0060aff9e8601fada9a617391dd9bf99d7c.jpg',
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height: 200.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: Text(
                                    'CBSE cuts Class 10, 12 syllabus by 15%, gives 40% priority to internal assessment',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: Color(0xFF101518),
                                          fontSize: 24.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: Text(
                                    'The Central Board for Secondary Education (CBSE) Board has decided to reduce pressure on Class 10 and Class 12 students by reducing the syllabus by 15 percent.\n\nAdditionally, the internal assessment will now carry a weight of around 40 percent.\n\nVikas Kumar Agrawal, the CBSE Regional Officer for Bhopal, shared these updates at the \'Bridging the Gap Principles\' summit held at the Brilliant Convention Centre in Indore, reported The Times of India.\n\nAgrawal also highlighted forthcoming changes to the CBSE exam evaluation system, which will soon implement a revised structure.\n\n40-60 FORMULA AND TWO-TERM EXAM STRUCTURE\n\nUnder the newly introduced evaluation structure, internal assessments will play a greater role in determining a student\'s final grade, now accounting for 40 percent. The remaining 60 percent will continue to rely on conventional written exams.\n\nThis change aims to encourage a more holistic assessment method, giving students multiple ways to demonstrate their knowledge and skills.\n\nIn a further move towards innovative learning, CBSE will introduce open-book exams in selected subjects, including English literature and social science.\n\nThis format is intended to enhance critical thinking by allowing students to consult their textbooks during the exam.\n\nRather than focusing solely on memorisation, these open-book assessments will challenge students to apply, analyse, and interpret information, helping them engage more deeply with the subject.',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: Color(0xFF57636C),
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ),
                              ].divide(SizedBox(height: 12.0)),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      child: Material(
                        color: Colors.transparent,
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0.0),
                                      bottomRight: Radius.circular(0.0),
                                      topLeft: Radius.circular(16.0),
                                      topRight: Radius.circular(16.0),
                                    ),
                                    child: Image.asset(
                                      'assets/images/642027347e994267ca326cc190895a9bc248c0d4e2095c45a351966eaf3b3887.jpg',
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height: 200.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: Text(
                                    'Israeli Airstrikes Eliminate 200 Hezbollah Terrorists, 140 Missile Launchers',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: Color(0xFF101518),
                                          fontSize: 24.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: Text(
                                    'Jerusalem [Israel], November 14 (ANI/TPS): Israeli airstrikes have killed approximately 200 Hezbollah terrorists and destroyed 140 rocket launchers in the past week, the Israel Defense Forces disclosed on Thursday morning.\n\n\nThe IDF said the launchers posed \"an immediate threat\" to the Israeli home front and soldiers operating in southern Lebanon.\n\nTargets included a launcher from which rockets were fired into the Western Galilee and central Israel on Tuesday and Wednesday, the army added.\n\nAmong the terrorists eliminated in the strikes were the head of battalion operations and the head of battalion anti-tank weapons in Hezbollah\'s Radwan Force in the coastal sector.\n\n\"These attacks and assassinations constitute another damage to the ability of the terrorist organization Hezbollah to promote and carry out terrorist operations from southern Lebanon against the Israeli rear on the northern border,\" the IDF said.\n\nMeanwhile, Lebanese media reported new airstrikes on the Dahieh district of Beirut. Dahieh is a Shi\'ite stronghold in the southern area of Lebanon\'s capital city. The IDF said on Wednesday it had destroyed \"a majority\" of the Iran-backed terror group\'s weapons storage and production facilities located below the neighbourhood.\n\n\"Over the past 20 years, the Hezbollah terrorist organization has established dozens of weapons production sites and storage facilities in the heart of the Dahieh district, the organization\'s governing stronghold. These sites, systematically concealed beneath civilian buildings, have produced and stored hundreds of missiles and rockets intended to inflict significant harm on the State of Israel,\" the army said.',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: Color(0xFF57636C),
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ),
                              ].divide(SizedBox(height: 12.0)),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      child: Material(
                        color: Colors.transparent,
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      child: Material(
                        color: Colors.transparent,
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      child: Material(
                        color: Colors.transparent,
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      child: Material(
                        color: Colors.transparent,
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0.0),
                                      bottomRight: Radius.circular(0.0),
                                      topLeft: Radius.circular(16.0),
                                      topRight: Radius.circular(16.0),
                                    ),
                                    child: Image.asset(
                                      'assets/images/1924edf127edc09b12731f627b7558af4b84235b686d0611dcf867485e273e28.jpg',
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height: 200.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: Text(
                                    'Kim Jong-un\'s new unseen pictures of North Korea are directly related to everyday life',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: Color(0xFF101518),
                                          fontSize: 24.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: Text(
                                    'Life in North Korea: Dictator Kim Jong has made such strict laws in his country North Korea, that his life is being cut in misery, backwardness and lack of basic facilities.\n\nRecently, the news agency Reuters has released some new unseen pictures of the people of North Korea.',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: Color(0xFF57636C),
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ),
                              ].divide(SizedBox(height: 12.0)),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      child: Material(
                        color: Colors.transparent,
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0.0),
                                      bottomRight: Radius.circular(0.0),
                                      topLeft: Radius.circular(16.0),
                                      topRight: Radius.circular(16.0),
                                    ),
                                    child: Image.asset(
                                      'assets/images/b9b7f2f8c24d06a53db825557f68e15a3d025ce19a18ae7b8b0bd97141644787.jpg',
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height: 200.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: Text(
                                    'Surprise 7% DA increase: Government employees to enjoy higher pay in December',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: Color(0xFF101518),
                                          fontSize: 24.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: Text(
                                    'The government has decided to increase the Dearness Allowance (DA) once again, bringing joy to government employees. Find out how much each employee will receive.',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: Color(0xFF57636C),
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ),
                              ].divide(SizedBox(height: 12.0)),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      child: Material(
                        color: Colors.transparent,
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0.0),
                                      bottomRight: Radius.circular(0.0),
                                      topLeft: Radius.circular(16.0),
                                      topRight: Radius.circular(16.0),
                                    ),
                                    child: Image.asset(
                                      'assets/images/4db85d61d096ff292a3a7b97bb51181abddf91e675a4f9851eaee9f162f25b93.jpg',
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height: 200.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: Text(
                                    'IPL 2025: 5 Released KKR players who could trigger bidding wars between CSK and DC at mega auction',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: Color(0xFF101518),
                                          fontSize: 24.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: Text(
                                    'Kolkata Knight Riders have retained six players in the form of Rinku Singh, Varun Chakaravarthy, Sunil Narine, Andre Russell, Harshit Rana and Ramandeep Singh. The franchises has utilised 57 crore out of their allotted 120 crore purse in retaining their key players.\n\nThey will enter the auction with 63 crore in their kitty. Rinku Singh became the most expensive player as he was retained for 13 crore.\n\nOn the other hand, franchises such as Chennai Super Kings and Delhi Capitals, who have 65 crore each left as they enter the auction, might try scouting some KKR talents. Though the Kolkata-based franchise has made some bold releases, their core group has remained intact. CSK and DC, who had a miserable outing last season, might aim to rope in some players who were part of the defending champions\' team.',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: Color(0xFF57636C),
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ),
                              ].divide(SizedBox(height: 12.0)),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          24.0, 24.0, 24.0, 24.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      child: Container(
                        height: 50.0,
                        decoration: BoxDecoration(),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          24.0, 24.0, 24.0, 24.0),
                      child: FutureBuilder<ApiCallResponse>(
                        future: TopStoriesCall.call(),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          final containerTopStoriesResponse = snapshot.data!;

                          return Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            decoration: BoxDecoration(),
                          );
                        },
                      ),
                    ),
                  ].divide(SizedBox(height: 24.0)),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
