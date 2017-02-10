
type AConfiguration* = ptr object

proc getDensity*(c: AConfiguration): int32 {.importc: "AConfiguration_getDensity".}
