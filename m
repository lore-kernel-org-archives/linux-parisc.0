Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id F2EE2483E
	for <parisc-linux@lists.parisc-linux.org>; Mon, 10 Nov 2003 07:00:43 -0700 (MST)
Date: Mon, 10 Nov 2003 15:00:37 +0100
Message-ID: <3F969FFE00009F73@ocpmta2.freegates.net>
In-Reply-To: <3F969FFE00009EA4@ocpmta2.freegates.net>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] C110 builtin nic slow?
To: "Grant Grundler" <grundler@parisc-linux.org>
Cc: "parisc-linux" <parisc-linux@lists.parisc-linux.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
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

Grant,

Sorry again, but having find this interesting stuff in 82596.c:
---------><---------
[...]
                        /* Check if the packet is long enough to just accept
                         * without copying to a properly sized skbuff.
                         */

                        if (pkt_len > rx_copybreak) {
                                struct sk_buff *newskb;
[...]
                        }
                        else
                                skb = dev_alloc_skb(pkt_len + 2);

[...]
---------><---------
This seems well what you describe?
and more:
---------><---------
[...]
/* Copy frames shorter than rx_copybreak, otherwise pass on up in
 * a full sized sk_buff.  Value of 100 stolen from tulip.c (!alpha).
 */
static int rx_copybreak = 100;
[...]
---------><---------
and finaly:
---------><---------
/*
[...]
   TBD:
   [...]
   * performace test to tune rx_copybreak
[...]
---------><---------

(I just copy as read preformace and not performance as my mind abuse :) )

This last notice seems what I am loocking for?
Have you a better idea then try and test (ie rx_copybreak=512, test, rx_copybreak=256,
... and btw rx_copybreak = PKT_BUF_SZ == 1536)?
Or is it better to tiddle code before?

Thanks for additional advise,
    Joel

>-- Original Message --
>From: "Joel Soete" <soete.joel@tiscali.be>
>To: "Grant Grundler" <grundler@parisc-linux.org>
>Cc: "parisc-linux" <parisc-linux@lists.parisc-linux.org>
>Date: Mon, 10 Nov 2003 13:31:45 +0100
>Subject: Re: [parisc-linux] C110 builtin nic slow?
>
>
>Sorry for auto-reply but I just remember that on the c110 the builtin nic
is:
"8. Raven T' Core LAN (802.3) (10) at 0xffd07000 [8/16/6], versions 0x32,

0x0, 0x8a"
ie a Lasi_82596 (as Matthew mentioned in a previous mail).

That you look for tha
> stuff in that code :)

Joel




-------------------------------------------------------------------------
Tiscali ADSL: 3 mois GRATUITS! L'Internet rapide, c'est pour tout le monde.

http://reg.tiscali.be/default.asp?lg=fr
