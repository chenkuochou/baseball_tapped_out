enum FieldingPosition {
  sp,
  rp,
  cl,
  c,
  b1,
  b2,
  b3,
  ss,
  lf,
  cf,
  rf,
  dh;

  String get displayName => switch (this) {
        FieldingPosition.sp => 'SP',
        FieldingPosition.rp => 'RP',
        FieldingPosition.cl => 'CL',
        FieldingPosition.c => 'C',
        FieldingPosition.b1 => '1B',
        FieldingPosition.b2 => '2B',
        FieldingPosition.b3 => '3B',
        FieldingPosition.ss => 'SS',
        FieldingPosition.lf => 'LF',
        FieldingPosition.cf => 'CF',
        FieldingPosition.rf => 'RF',
        FieldingPosition.dh => 'DH',
      };
}
