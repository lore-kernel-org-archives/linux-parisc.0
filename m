Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 37DFC4843
	for <parisc-linux@lists.parisc-linux.org>; Wed, 13 Feb 2002 15:45:38 -0700 (MST)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <deller@gmx.de>
To: "Holst, Richard G (Dick), PROSH" <dholst@att.com>,
	<parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] parisc-linux on a D server
Date: Wed, 13 Feb 2002 23:42:40 +0100
References: <28F05913385EAC43AF019413F674A01701380082@OCCLUST04EVS1.ugd.att.com>
In-Reply-To: <28F05913385EAC43AF019413F674A01701380082@OCCLUST04EVS1.ugd.att.com>
MIME-Version: 1.0
Message-Id: <200202132342.40907.deller@gmx.de>
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

On Wednesday 13 February 2002 22:25, Holst, Richard G (Dick), PROSH wrote:
> The system boots, I get the Penguin in the upper left corner of the video
> display followed by some text. The last message I see on the VGA display is
> about start the Gnome mgr. The output then reverts back to the serial
> terminal and I get a login prompt.
>
> I looked at the messages in the dmesg file, and it tells me that it can't
> find the display. Has anyone else run into the problem? Any help or a push
> in the right direction would be greatly appreciated.

Check your resolution and mouse settings in the XF86Config-4 file.
Please also read the FAQ at http://www.parisc-linux.org

Helge
