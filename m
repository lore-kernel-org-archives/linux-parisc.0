Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.tiscali.be (unknown [62.235.14.106])
	by dsl2.external.hp.com (Postfix) with ESMTP id C2CC64829
	for <parisc-linux@lists.parisc-linux.org>; Mon,  2 Sep 2002 23:54:52 -0600 (MDT)
Date: Tue, 3 Sep 2002 07:47:59 +0200
Message-ID: <3D3815BD0000AB5F@ocpmta5.be.tiscali.com>
In-Reply-To: <20020902164424.GE14634@tausq.org>
From: jsoe0708@tiscali.be
Subject: Re: [parisc-linux] Gcc-3.2 beside gcc-3.0: HOWTO?
To: "Randolph Chung" <randolph@tausq.org>
Cc: parisc-linux@lists.parisc-linux.org
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

Hi Randolph,

>
>> Oops the 32bits kernel which I obtain, boot well on my b2k but ip connection
>> problem is always there: the system seems to loop somewhere with ssh (heart
>> bit seems life and no more response neither at serial console, neither
>at
>> ssh prompt) and telnet causes an HPMC (bus timeout?)
>
>looking up the iaoq and gr02 values reported in the hpmc in System.map 
>would be the first step...
>
Too bad, I forget to mentionned that I just read some HPMC messages on the
LCD display of my b2k and do not get any status dump info on console (which
just stay locked at login prompt). Do you think that kdb works now? (if yes
where can I learn how to get iaoq and gr02 info?)

Thanks a lot,
    Joel
