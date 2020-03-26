Class ITGFlexibleAssetField {
    [int64]$Id
    [string]$Name
    [string]$Kind
    [string]$Hint
    [int]$Decimals
    [string]$DefaultValue
    [string]$TagType
    [bool]$Required
    [bool]$Expiration
    [bool]$ShowInList
    [bool]$NameKey
    [datetime]$CreateDate
    [datetime]$UpdateDate

    #region Initiators
    ########################################################################

    # empty initiator
    ITGFlexibleAssetField() {
    }

    ########################################################################
    #endregion Initiators
}
