Class ITGOrganization {
    [string]$Name
    [string]$OrganizationType
    [string]$OrganizationStatus
    [string]$ShortName
    [string]$Description
    [string]$QuickNotes
    [string]$Alert
    [int64]$Id

    #region Initiators
    ########################################################################

    # empty initiator
    ITGOrganization() {
    }

    ########################################################################
    #endregion Initiators
}
