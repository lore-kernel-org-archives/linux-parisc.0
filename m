Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Zibing Yang <email2bing@yahoo.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Can I run popular Linux software on parisc-linux? 
In-Reply-To: Message from Zibing Yang <email2bing@yahoo.com>
   of "Mon, 27 May 2002 09:56:26 PDT." <20020527165626.35993.qmail@web21209.mail.yahoo.com>
References: <20020527165626.35993.qmail@web21209.mail.yahoo.com> 
Date: Mon, 27 May 2002 13:07:36 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020527190736.9AC3D4840@dsl2.external.hp.com>
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

Zibing Yang wrote:
> Hi,
> I am a beginner in linux and recently got a used HP
> Visualize C3600 workstation.

Beware that only Vis-EG PCI is supported by parisc-linux 
on that box.

...
> As far as I know, most of the softwares were developed for
> PC-based Linux.

Under debian, 95% of the packages build on nearly every CPU architecture.
See http://buildd.debian.org/stats/.

> Particularly I would like to know if I
> could run office-like software, windows-emulator,
> video-rendering software. 

In general, you should look for packages in "testing" here:
	http://www.debian.org/distrib/packages

kword is available though I've never used it.
I'm not aware of anyone trying to run an IA32 emulator on parisc-linux.
gimp and gqview seem to work. Not sure what's availble
for video (eg mpeg) editing.

grant
