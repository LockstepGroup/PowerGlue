Class ITGFlexibleAsset {
    [int64]$Id
    [string]$Name
    [datetime]$CreateDate
    [datetime]$UpdateDate

    [int64]$OrganizationId
    [string]$OrganizationName

    [string]$ResourceUrl

    [bool]$Restricted
    [bool]$MyGlue

    [int64]$FlexibleAssetTypeId
    [string]$FlexibleAssetTypeName

    [psobject[]]$Trait

    #region Initiators
    ########################################################################

    # empty initiator
    ITGFlexibleAsset() {
    }

    ########################################################################
    #endregion Initiators
}
