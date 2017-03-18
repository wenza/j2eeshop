Module - Newsletter
    ModuleData (Customer optin/out)
        id
        Col1 = email //indexed
        Col2 = customer-id //indexed
        Col3 = browser-info-id //indexed
        Col4 = opted-date
        Col5 = optout-date

    ModuleData (MailData)
        Col1 = Customer optin/out ID (ModuleData.id)
        Col2 = //data/mailcontent_'+this.id+'.props
        Col3 = sentDate;
