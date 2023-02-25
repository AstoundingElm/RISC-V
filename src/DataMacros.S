
.macro createByte(%data, %secondData, %name)

.data

%name:
.byte %data
.byte %secondData
.text
.end_macro