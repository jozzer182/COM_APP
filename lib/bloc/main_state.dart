part of 'main_bloc.dart';

class MainState {
  String message;
  int messageCounter;
  int errorCounter;
  Color messageColor;
  bool isLoading;
  bool isDark = false;
  Color? themeColor;
  User? user;
  Users? users;
  Perfiles? perfiles;
  Oe? oe;
  SegOda? segOda;
  SegOdas? segOdas;
  int dialogCounter;
  String dialogMessage;
  Usdcop? usdcop;
  Eurcop? eurcop;
  ResumenProveedor? resumenProveedor;
  ResumenProyecto? resumenProyecto;
  ResumenGeneral? resumenGeneral;
  ResumenAnticipos? resumenAnticipos;
  ResumenGestor? resumenGestor;
  Contrato? contrato;
  ContratoPlanilla? contratoPlanilla;
  ListadoContratos? listadoContratos;
  ListadoPosiciones? listadoPosiciones;
  ListadoOdas? listadoOdas;
  PreordenList? preordenList;
  PreordenDoc? preordenDoc;
  Plataforma? plataforma;
  FemList? femList;
  PreanalisisList? preanalisisList;
  Versiones? versiones;
  Budget? budget;
  Wbe? wbe;
  HistoricoList? historicoList;

  MainState({
    this.message = '',
    this.messageCounter = 0,
    this.errorCounter = 0,
    this.messageColor = Colors.red,
    this.isLoading = false,
    this.isDark = false,
    this.themeColor,
    this.user,
    this.users,
    this.perfiles,
    this.oe,
    this.segOda,
    this.segOdas,
    this.dialogCounter = 0,
    this.dialogMessage = '',
    this.usdcop,
    this.eurcop,
    this.resumenProveedor,
    this.resumenProyecto,
    this.resumenGeneral,
    this.resumenAnticipos,
    this.resumenGestor,
    this.contrato,
    this.contratoPlanilla,
    this.listadoContratos,
    this.listadoPosiciones,
    this.listadoOdas,
    this.preordenList,
    this.preordenDoc,
    this.plataforma,
    this.femList,
    this.preanalisisList,
    this.versiones,
    this.budget,
    this.wbe,
    this.historicoList,
  });

  initial() {
    // message = '';
    // messageCounter = 0;
    // errorCounter = 0;
    messageColor = Colors.red;
    isLoading = false;
    isDark = false;
    themeColor = null;
    user = null;
    users = null;
    perfiles = null;
    oe = null;
    segOda = null;
    segOdas = null;
    dialogCounter = 0;
    dialogMessage = '';
    usdcop = null;
    eurcop = null;
    resumenProveedor = null;
    resumenProyecto = null;
    resumenGeneral = null;
    resumenAnticipos = null;
    resumenGestor = null;
    contrato = null;
    contratoPlanilla = null;
    listadoContratos = null;
    listadoPosiciones = null;
    listadoOdas = null;
    preordenList = null;
    preordenDoc = null;
    plataforma = null;
    femList = null;
    preanalisisList = null;
    versiones = null;
    budget = null;
    wbe = null;
    historicoList = null;
  }

  MainState copyWith({
    String? message,
    int? messageCounter,
    int? errorCounter,
    Color? messageColor,
    bool? isLoading,
    bool? isDark,
    Color? themeColor,
    User? user,
    Users? users,
    Perfiles? perfiles,
    Oe? oe,
    SegOda? segOda,
    SegOdas? segOdas,
    int? dialogCounter,
    String? dialogMessage,
    Usdcop? usdcop,
    Eurcop? eurcop,
    ResumenProveedor? resumenProveedor,
    ResumenProyecto? resumenProyecto,
    ResumenGeneral? resumenGeneral,
    ResumenAnticipos? resumenAnticipos,
    ResumenGestor? resumenGestor,
    Contrato? contrato,
    ContratoPlanilla? contratoPlanilla,
    ListadoContratos? listadoContratos,
    ListadoPosiciones? listadoPosiciones,
    ListadoOdas? listadoOdas,
    PreordenList? preordenList,
    PreordenDoc? preordenDoc,
    Plataforma? plataforma,
    FemList? femList,
    PreanalisisList? preanalisisList,
    Versiones? versiones,
    Budget? budget,
    Wbe? wbe,
    HistoricoList? historicoList,
  }) {
    return MainState(
      message: message ?? this.message,
      messageCounter: messageCounter ?? this.messageCounter,
      errorCounter: errorCounter ?? this.errorCounter,
      messageColor: messageColor ?? this.messageColor,
      isLoading: isLoading ?? this.isLoading,
      isDark: isDark ?? this.isDark,
      themeColor: themeColor ?? this.themeColor,
      user: user ?? this.user,
      users: users ?? this.users,
      perfiles: perfiles ?? this.perfiles,
      oe: oe ?? this.oe,
      segOda: segOda ?? this.segOda,
      segOdas: segOdas ?? this.segOdas,
      dialogCounter: dialogCounter ?? this.dialogCounter,
      dialogMessage: dialogMessage ?? this.dialogMessage,
      usdcop: usdcop ?? this.usdcop,
      eurcop: eurcop ?? this.eurcop,
      resumenProveedor: resumenProveedor ?? this.resumenProveedor,
      resumenProyecto: resumenProyecto ?? this.resumenProyecto,
      resumenGeneral: resumenGeneral ?? this.resumenGeneral,
      resumenAnticipos: resumenAnticipos ?? this.resumenAnticipos,
      resumenGestor: resumenGestor ?? this.resumenGestor,
      contrato: contrato ?? this.contrato,
      contratoPlanilla: contratoPlanilla ?? this.contratoPlanilla,
      listadoContratos: listadoContratos ?? this.listadoContratos,
      listadoPosiciones: listadoPosiciones ?? this.listadoPosiciones,
      listadoOdas: listadoOdas ?? this.listadoOdas,
      preordenList: preordenList ?? this.preordenList,
      preordenDoc: preordenDoc ?? this.preordenDoc,
      plataforma: plataforma ?? this.plataforma,
      femList: femList ?? this.femList,
      preanalisisList: preanalisisList ?? this.preanalisisList,
      versiones: versiones ?? this.versiones,
      budget: budget ?? this.budget,
      wbe: wbe ?? this.wbe,
      historicoList: historicoList ?? this.historicoList,
    );
  }
}
