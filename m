Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtpde02.sap-ag.de (smtpde02.sap-ag.de [194.39.131.53])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2D7D04845
	for <parisc-linux@parisc-linux.org>; Mon,  7 Jan 2002 04:37:21 -0700 (MST)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <helge.deller@sap.com>
To: "Peter Lavender" <plaven@bigpond.net.au>,
	"parisc" <parisc-linux@parisc-linux.org>
Subject: Re: [parisc-linux] mpg321 on 715/64?
Date: Mon, 7 Jan 2002 12:36:59 +0100
References: <009d01c19763$f1f9c900$090ba8c0@winnie>
In-Reply-To: <009d01c19763$f1f9c900$090ba8c0@winnie>
MIME-Version: 1.0
Message-Id: <E16NY5Z-0003CZ-00@linuxlab.wdf.sap-ag.de>
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

On Monday 07 January 2002 11:13, Peter Lavender wrote:
> Hi Everyone,
>
> thought I'd give mpg321 a try on my 715/64 after installing the .9.3
> release.  The playback is very slow.  CPU useage appeared to be about 33%,
> so it doesn't appear to be taxing it.
>
> The mp3's are encoded at 44khz 128bit.
>
> Would this box have a problem in general with running this program, or is
> that I just apt-get install and that's it and I now need to tweak things?

Get yourself the latest kernel (>= 2.4.17-pa5) and update to the latest
mpg321 and it will work perfectly on your machine.
I tested it myself on my 715/64.

> Are these sorts of questions even on topic for this list?

Yes

> Pete

Helge
