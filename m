Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.goquest.com (mail.goquest.com [63.172.73.8])
	by dsl2.external.hp.com (Postfix) with SMTP id 407A3484A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 11 Jun 2002 06:18:28 -0600 (MDT)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Michael S.Zick <mszick@goquest.com>
To: Thibaut VARENE <varenet@esiee.fr>,
	Ryan Bradetich <rbradetich@uswest.net>
Subject: Re: [parisc-linux] 2.4.18-pa35 SMP process hangs on a J200
Date: Tue, 11 Jun 2002 07:10:04 -0500
Cc: parisc-linux@lists.parisc-linux.org, grundler@cup.hp.com,
	Randolph Chung <randolph@tausq.org>
References: <5BA66B90-7D12-11D6-B01F-0030656F07A2@esiee.fr>
In-Reply-To: <5BA66B90-7D12-11D6-B01F-0030656F07A2@esiee.fr>
MIME-Version: 1.0
Message-Id: <02061107100403.00732@localhost.localdomain>
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

On Tuesday 11 June 2002 03:08 am, Thibaut VARENE wrote:
> Le mardi 11 juin 2002, à 07:36 , Ryan Bradetich a écrit :
> > Digging into the system a bit, here is what I found:
> >
> > 	* The setiathome process that hung (PID 326) will hang any other
> > 	  process that tries to access /proc/326/*.  (This is why top,
> > 	  ps, etc all hang after the process gets stuck).
Sirs...

I SEEM to experience a similar situation on 2.4.18-linux-x86-SMP using the 
P111-S processors (with 512K L2 cache).
Quite rare; evidently some very small window for failure.
I don't have any solid leads yet (although I have theories).

Just a note that it might not be HPPA specific.

Mike
