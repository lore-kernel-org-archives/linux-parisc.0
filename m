Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA10898
	for <parisc-linux@puffin.external.hp.com>; Fri, 3 Mar 2000 12:13:40 -0700
Message-ID: <015401bf853c$684a1240$4c50fb8d@corpnorth.baynetworks.com>
Reply-To: "Rajiv Dighe" <rdighe@nortelnetworks.com>
From: "Rajiv Dighe" <rdighe@nortelnetworks.com>
To: "Rajiv Dighe" <rdighe@nortelnetworks.com>,
        Grant Grundler <grundler@cup.hp.com>
Cc: parisc-linux <parisc-linux@thepuffingroup.com>
References: <200003031748.JAA02166@milano.cup.hp.com>
Subject: Re: [parisc-linux] Trouble booting 712/80
Date: Fri, 3 Mar 2000 13:15:08 -0500
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
List-ID: <linux-parisc.vger.kernel.org>

Grant,

     I do have firmware image 2.3 on a tape for this machine...same problem
though...how can I boot using that image if this machine won't let me boot??
I will try to setup netbooting environment this weekend..but not even sure
if that will work...

--Rajiv
---------------------------------------
NetID Group
Nortel Networks
613-798-4914
---------------------------------------

----- Original Message -----
From: "Grant Grundler" <grundler@cup.hp.com>
To: "Dighe, Rajiv (R.) [EXCHANGE:CANOI:IO47]" <rdighe@americasm01.nt.com>
Cc: "parisc-linux" <parisc-linux@thepuffingroup.com>
Sent: Friday, March 03, 2000 12:48 PM
Subject: Re: [parisc-linux] Trouble booting 712/80


> "Rajiv Dighe" wrote:
> > Hi,
> >
> >     HP newbie here. I just acquired a 712/80 with 96mb ram & 1gb hdd. I
am
> > looking forward to helping with linux port effort as soon as I can get
HP/UX
> > 10.20 installed on this darn machine. so far it refuses t o boot from
> > cd-rom. cd-rom is seen as a result of search command issued at
boot-admin
> > prompt but 'boot scsi.5' just returns me back to boot_admin promt after
> > about 5 seconds. boot rom version is 1.6. All I know is that this
machine
> > was set for netbooting. any ideas?
>
> Two things:
> 1) If you are planning on cold installing the box, I'd reccomend HP-UX
>    11.x (preferably 9910 release) as that's what the tool chains are
>    being tested with. 10.20 should work too but you know....
>
> 2) iirc, The latest rev of 712 firmware is v2.3.
>    Can some other HP person comment on if we can post the upgrade
>    tools on the web for 712/715/et al?
>    (The risk is someone will blow away their firmware with an image
>    for the wrong box and blame HP).
>
> grant
>
> Grant Grundler
> Unix Development Lab
> +1.408.447.7253
