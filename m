Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm6.tiscalinet.be [212.35.2.61])
	by dsl2.external.hp.com (Postfix) with ESMTP id 235BE4829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 21 Oct 2002 10:52:36 -0600 (MDT)
Date: Mon, 21 Oct 2002 19:48:48 +0200
Message-ID: <3DA56CAE00003F03@ocpmta8.be.tiscali.com>
In-Reply-To: <20021021164254.GW5602@tausq.org>
From: jsoe0708@tiscali.be
Subject: Re: [parisc-linux] jfs-1.0.23 as well xfs-cvs break fb console on k-2.4.19-pa22
To: "Randolph Chung" <randolph@tausq.org>
Cc: "Grant Grundler" <grundler@dsl2.external.hp.com>,
	"Joel Soete" <joel.soete@freebel.net>,
	parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

>-- Original Message --
>Date: Mon, 21 Oct 2002 09:42:54 -0700
>From: Randolph Chung <randolph@tausq.org>
>To: jsoe0708@tiscali.be
>Cc: Grant Grundler <grundler@dsl2.external.hp.com>,
>	Joel Soete <joel.soete@freebel.net>,
>	parisc-linux@lists.parisc-linux.org
>Subject: Re: [parisc-linux] jfs-1.0.23 as well xfs-cvs break fb console
on
>k-2.4.19-pa22
>Reply-To: Randolph Chung <randolph@tausq.org>
>http://webmail.tiscali.be/mail/MessageReplyAll?sid=5EE24D73986685F6BB8554D60A54F6B3D78F70EA&userid=jsoe0708@tiscali.be&seq=C&auth=HQABMXGH0KEBXZNU&srcfolder=INBOX&uid=2152&style=frans&abcompose=0
:: envoyer
>
>> it sounds like a gcc bug:
>> 
>> simply adding "printk("VC: %s: %d\n", __FUNCTION__, __LINE__);" some where
>> in the middle of take_over_console (to check the way) and the problem
is
>> solved???
>
>unlikely a gcc bug, more likely is that the code has some timing
>dependencies and adding printk changed the timing.
>
Ok, I see (So I will try some wait to locate more accurately the problem)

Thanks for advise,
    Joel
