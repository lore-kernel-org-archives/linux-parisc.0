Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: James S <smithjames@comcast.net>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Missing beep 
In-Reply-To: Message from James S <smithjames@comcast.net>
   of "Thu, 04 Apr 2002 11:58:21 EST." <006901c1dbf9$ed82da80$02c1a8c0@james.co.uk>
References: <009e01c1db57$21207ee0$02c1a8c0@james.co.uk> <20020404063354.5428C482A@dsl2.external.hp.com>  <006901c1dbf9$ed82da80$02c1a8c0@james.co.uk> 
Date: Thu, 04 Apr 2002 22:43:42 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020405054342.1DA88482B@dsl2.external.hp.com>
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

James S wrote:
> yes it does & can play mp3s, but surely the 'beep' is independant of the
> sound driver - the 486 has no sound card, for example.

Apple //e could beep w/o a sound card too...we even had it talking.

My understanding the speaker is wired to harmony device.
Driver needs to tell harmony to make beep if that's what you
want coming out of the speaker.

My guess is bash "sound" isn't being directed to /dev/audio or
whatever device it needs to tell to make a beep.  I was asking
to verify the driver is in place and working.

grant
