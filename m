Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from transport.cksoft.de (transport.cksoft.de [62.111.66.27])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7E84B482E
	for <parisc-linux@lists.parisc-linux.org>; Thu, 14 Nov 2002 15:32:36 -0700 (MST)
Date: Thu, 14 Nov 2002 22:32:57 +0000 (UTC)
From: "Bjoern A. Zeeb" <bzeeb-lists@lists.zabbadoz.net>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: Matt Taggart <taggart@carmen.fc.hp.com>,
	"Bjoern A. Zeeb" <bzeeb-lists@lists.zabbadoz.net>,
	<parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] strange mail routing problem for mail from this
In-Reply-To: <200211142203.gAEM3ppD012983@hiauly1.hia.nrc.ca>
Message-ID: <Pine.BSF.4.44.0211142219580.39295-100000@e0-0.zab2.int.zabbadoz.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Thu, 14 Nov 2002, John David Anglin wrote:

> > "Bjoern A. Zeeb" writes...
> >
> > [snip]
> > > a simple grep for 144.249.122.105 and 212.125.75.12 should be
> > > sufficient.
> > [snip]
> > > PS: the same simple grep should word for the maillogs on
> > > parisc-linux.org if anybody else with access there can find the time.
> >
> > No occurance of those IPs or "messagelabs.com" in any of the
> > parisc-linux.org mail logs.
>
> This might be related to the "Antispam" messages that senders on the
> list were receiving.  I received messages of the type above.

ok, but why ? does parisc-linux run anything related ?

Matt: might you please grep for the postfix msgID 361CF4837 and check
where this mail was sent to from mail.parisc-linux.org aka
dsl2.external.hp.com ? the to= -line is the interesting one...

--- interesting headers again ---
Received: from naex017w.apci.com (smtp2.apci.com [204.27.156.103])
	by ns1.cksoft.de (Postfix) with ESMTP id 232CC15145B
	for <bzeeb-lists@lists.zabbadoz.net>; Thu, 14 Nov 2002 05:54:32 +0100 (CET)
Received: from mail pickup service by naex017w.apci.com with Microsoft
    SMTPSVC;
	 Wed, 13 Nov 2002 23:39:46 -0500
Received: from Local ([144.249.122.105]) by 144.249.122.105 with Trend
    Micro InterScan Messaging Security Suite for SMTP v5.01; Tue,
     12 Nov 2002 14:01:07 -0500
Received: from mail4.messagelabs.com ([212.125.75.12]) by Local with
    Microsoft SMTPSVC(5.0.2195.4905);
	 Tue, 12 Nov 2002 14:01:07 -0500
X-VirusChecked: Checked
X-Env-Sender: parisc-linux-admin@lists.parisc-linux.org
X-Msg-Ref: server-15.tower-4.messagelabs.com!1037127908!34785
Received: (qmail 4995 invoked from network); 12 Nov 2002 19:05:09 -0000
Received: from smtp1.apci.com (HELO naex016w.apci.com) (204.27.156.18)
  by server-15.tower-4.messagelabs.com with SMTP; 12 Nov 2002 19:05:09 -0000
Received: from dsl2.external.hp.com ([192.25.206.7]) by naex016w.apci.com
    with Microsoft SMTPSVC(5.0.2195.4905);
	 Tue, 12 Nov 2002 13:59:59 -0500
Received: from dsl2.external.hp.com (localhost [127.0.0.1])
	by dsl2.external.hp.com (Postfix) with ESMTP
	id 361CF4837; Tue, 12 Nov 2002 12:05:07 -0700 (MST)
Delivered-To: parisc-linux@lists.parisc-linux.org
Received: from dsl2.external.hp.com (localhost [127.0.0.1])
	by dsl2.external.hp.com (Postfix) with ESMTP
	id F11C14829; Tue, 12 Nov 2002 12:04:26 -0700 (MST)
To: "Bjoern A. Zeeb" <bzeeb-lists@lists.zabbadoz.net>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] [2.5] rtc doesn't build
In-Reply-To: Message from "Bjoern A. Zeeb" <bzeeb-lists@lists.zabbadoz.net>
   of "Tue, 12 Nov 2002 18:57:07 GMT."
    <Pine.BSF.4.44.0211121854470.32930-100000@e0-0.zab2.int.zabbadoz.net>
References:
    <Pine.BSF.4.44.0211121854470.32930-100000@e0-0.zab2.int.zabbadoz.net>
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20021112190427.F11C14829@dsl2.external.hp.com>
X-BeenThere: parisc-linux@lists.parisc-linux.org
X-Mailman-Version: 2.0.11
Precedence: bulk
Date: Tue, 12 Nov 2002 12:04:26 -0700
X-OriginalArrivalTime: 12 Nov 2002 18:59:59.0515 (UTC)
    FILETIME=[B2CD76B0:01C28A7D]
--- ... ---

-- 
Bjoern A. Zeeb				bzeeb at Zabbadoz dot NeT
56 69 73 69 74				http://www.zabbadoz.net/
