From: jsoe0708@tiscali.be
Subject: Re: [parisc-linux] new gcc-snapshot problem [was: new gcc-default for hppa]
Date: Tue, 14 Jan 2003 15:44:46 +0100
Message-ID: <3DED9A6600005946__26590.93703046$1416622110$gmane$org@ocpmta3.freegates.net>
References: <200301141354.h0EDsNjn028670@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Cc: tausq@debian.org, parisc-linux@lists.parisc-linux.org,
	debian-hppa@lists.debian.org
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <200301141354.h0EDsNjn028670@hiauly1.hia.nrc.ca>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

>
>> I have a look and in drivers/ide/ide-cd.h line 440 I found well:
>>     __u8 short slot_tabelen;
>> 
>> Any idea?
>
>Look at the code after preprocessing with "-E" option.  This will
>show you the actual code where the fault occurs.
>
Hi Dave,

Good idea and I do so for tree compiler still install:
gcc-3.0 -E

struct atapi_mechstat_header {

        __u8 fault : 1;
        __u8 changer_state : 2;
        __u8 curslot : 5;
# 427 "ide-cd.h"
        __u8 mech_state : 3;
        __u8 door_open : 1;
        __u8 reserved1 : 4;
# 438 "ide-cd.h" 
        byte curlba[3];
        byte nslots;
        __u8 short slot_tablelen;
};

gcc-3.2 -E

struct atapi_mechstat_header {

        __u8 fault : 1;
        __u8 changer_state : 2;
        __u8 curslot : 5;
# 427 "ide-cd.h"
        __u8 mech_state : 3;
        __u8 door_open : 1;
        __u8 reserved1 : 4;
# 438 "ide-cd.h"
        byte curlba[3];
        byte nslots;
        __u8 short slot_tablelen;
};

gcc-3.3 -E

struct atapi_mechstat_header {

        __u8 fault : 1;
        __u8 changer_state : 2;
        __u8 curslot : 5;
# 427 "ide-cd.h"
        __u8 mech_state : 3;
        __u8 door_open : 1;
        __u8 reserved1 : 4;
# 438 "ide-cd.h"
        byte curlba[3];
        byte nslots;
        __u8 short slot_tablelen;
};

Do you notice any difference OTC above I encounter another use of slot_ta=
blelen
as:

struct cdrom_mechstat_header {

        __u8 fault : 1;
        __u8 changer_state : 2;
        __u8 curslot : 5;
        __u8 mech_state : 3;
        __u8 door_open : 1;
        __u8 reserved1 : 4;
# 927 "/usr/src/linux-2.4.20-pa21/include/linux/cdrom.h"
        __u8 curlba[3];
        __u8 nslots;
        __u16 slot_tablelen;
};

hmm could this be a typo at one moment "unsigned short" would be changed
"__u8 short" ???

More over what could be the actual patch:
__u8 slot_tablelen;

or as in the 2d structure

__u16 slot_tablelen;

Cheers,
    Joel


*********************************************
Vous surfez toujours avec une ligne classique ?
Faites des economies avec Tiscali Complete...
Plus d'info sur ... http://complete.tiscali.be
