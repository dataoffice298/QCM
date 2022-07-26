tableextension 50007 tableextension70000003 extends "Purch. Rcpt. Line"
{
    // version NAVW19.00.00.45778,NAVIN9.00.00.45778,B2BQC1.00.00,PO

    fields
    {

        //Unsupported feature: Deletion on ""KK Cess%"(Field 16542)". Please convert manually.


        //Unsupported feature: Deletion on ""KK Cess Amount"(Field 16543)". Please convert manually.

        field(50001; "Free Item Type"; Option)
        {
            Description = 'B2B1.0 13Dec2016';
            OptionCaption = '" ,Same Item,Different Item"';
            OptionMembers = " ","Same Item","Different Item";
        }
        field(50002; "Free Item No."; Code[20])
        {
            Description = 'B2B1.0 13Dec2016';
            TableRelation = Item;
        }
        field(50003; "Free Unit of Measure Code"; Code[10])
        {
            CaptionML = ENU = 'Free Unit of Measure Code',
                        ENN = 'Unit of Measure Code';
            Description = 'B2B1.0 13Dec2016';
            TableRelation = "Item Unit of Measure".Code WHERE("Item No." = FIELD("Free Item No."));
        }
        field(50004; "Free Quantity"; Decimal)
        {
            CaptionML = ENU = 'Free Quantity',
                        ENN = 'Minimum Quantity';
            Description = 'B2B1.0 13Dec2016';
            MinValue = 0;
        }
        field(50005; "Parent Line No."; Integer)
        {
            Description = 'B2B1.0 13Dec2016';
            Editable = false;
        }
        field(50052; Free; Boolean)
        {
            Description = 'B2B1.0 13Dec2016';
            Editable = false;
        }
        field(50053; "Approved Vendor"; Boolean)
        {
            Description = 'B2B1.0 05 Dec2016';
        }
        field(50054; "Agreement No."; Code[20])
        {
            Description = 'B2B1.0 06 Dec2016';
        }
        field(60001; "Indent No."; Code[20])
        {
            Description = 'B2B1.0';
        }
        field(60002; "Indent Line No."; Integer)
        {
            Description = 'B2B1.0';
        }
        field(60003; "Indent Due Date"; Date)
        {
            Description = 'B2B1.0';
        }
        field(60004; "Indent Reference"; Text[50])
        {
            Description = 'B2B1.0';
        }
        field(60005; "Revision No."; Code[10])
        {
            Description = 'B2B1.0';
        }
        field(60006; "Production Order"; Code[20])
        {
            Description = 'B2B1.0';
            Editable = false;
            TableRelation = "Production Order"."No." WHERE(Status = CONST(Released));
        }
        field(60007; "Production Order Line No."; Integer)
        {
            Description = 'B2B1.0';
            Editable = false;
        }
        field(60008; "Drawing No."; Code[20])
        {
            Description = 'B2B1.0';
            Editable = false;
            TableRelation = Item;
        }
        field(60009; "Sub Operation No."; Code[20])
        {
            Description = 'B2B1.0';
            Editable = false;
            TableRelation = "Prod. Order Routing Line"."Operation No." WHERE("Prod. Order No." = FIELD("Production Order"),
                                                                              "Routing Reference No." = FIELD("Production Order Line No."),
                                                                              "Routing No." = FIELD("Routing No."));
        }


        field(33002903; "Delivery Rating"; Decimal)
        {
            Description = 'PO1.0';
        }
        field(33002904; "Indent Req No"; Code[20])
        {
            Description = 'PO1.0';
            Editable = false;
        }
        field(33002905; "Indent Req Line No"; Integer)
        {
            Description = 'PO1.0';
            Editable = false;
        }
    }
    keys
    {
        /*
        key(Key1;"Indent No.","Indent Line No.")
        {
            SumIndexFields = Quantity;
        }
        key(Key2;Type,"Buy-from Vendor No.","No.")
        {
            SumIndexFields = Quantity;
        }
        key(Key3;"Buy-from Vendor No.","No.",Type)
        {
            SumIndexFields = Quantity,"Delivery Rating";
        }*///Balu
    }

    //Unsupported feature: InsertAfter on "Documentation". Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.


    var
        //"--B2BQC1.00.00--" : ;
        Text33000250: Label 'Sum of the Quantity Accepted and Rejected should not be more than Receipt Quantity.';
}

