Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 36FC4485C
	for <parisc-linux@lists.parisc-linux.org>; Fri, 15 Feb 2002 00:30:31 -0700 (MST)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <deller@gmx.de>
To: Christian Suder <csuder@cisco.com>,
	"James S" <smith-james@home.com>
Subject: Re: [parisc-linux] Power LED
Date: Fri, 15 Feb 2002 08:26:57 +0100
Cc: parisc-linux@lists.parisc-linux.org
References: <002101c1b5ee$b5f8a620$02c1a8c0@james.co.uk> <20020214231312.37ca1c9e.csuder@cisco.com>
In-Reply-To: <20020214231312.37ca1c9e.csuder@cisco.com>
MIME-Version: 1.0
Message-Id: <200202150826.29543.deller@gmx.de>
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

On Friday 15 February 2002 08:13, Christian Suder wrote:
> On Fri, 15 Feb 2002 02:02:19 -0500
> "James S" <smith-james@home.com> wrote:
> > is it possible to hook the power button to the shutdown command like it
> > is in hp-ux ?
>
> The LED and the powerswitch work as expected on my 712/80 at least since
> the 0.9.3 ISO timeframe. 

It depends.
I know the power button works correctly on my c3000 and 715/64. Both
systems shuts down the computer cleanly.
But on another Apollo/50 machine (712/50 or 715/50 - I don't remember) 
pressing the power-button turns off the machine immediately. This is a bug
and should be fixed if possible.

Helge
