Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id AD6A24829
	for <parisc-linux@lists.parisc-linux.org>; Wed, 25 Sep 2002 10:53:36 -0600 (MDT)
From: Helge Deller <deller@gmx.de>
To: Matthew Wilcox <willy@debian.org>, jsoe0708@tiscali.be
Subject: Re: [parisc-linux] Failure when compile 2.4.19-pa20
Date: Wed, 25 Sep 2002 18:47:30 +0200
Cc: parisc-linux@lists.parisc-linux.org
References: <3D8F011400000BEB@ocpmta2.be.tiscali.com> <20020925170225.D25721@parcelfarce.linux.theplanet.co.uk>
In-Reply-To: <20020925170225.D25721@parcelfarce.linux.theplanet.co.uk>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Message-Id: <200209251847.30715.deller@gmx.de>
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

On Wednesday 25 September 2002 18:02, Matthew Wilcox wrote:
> On Wed, Sep 25, 2002 at 05:56:08PM +0200, jsoe0708@tiscali.be wrote:
> > I got USB part of .config from debian-configs/32 (I work on a b180) and
> > try to compile 2.4.19-pa20 but it failled:
>
> i'd guess you didn't select CONFIG_INPUT

CONFIG_INPUT=y
CONFIG_INPUT_EVDEV=y

helge
