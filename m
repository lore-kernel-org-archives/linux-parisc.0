Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtpde02.sap-ag.de (smtpde02.sap-ag.de [194.39.131.53])
	by dsl2.external.hp.com (Postfix) with ESMTP id 259C8482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 28 Jan 2002 04:45:02 -0700 (MST)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <helge.deller@sap.com>
To: Sven Cronenberg <sven.cronenberg@web.de>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] HIL Keyboard under X-Free
Date: Mon, 28 Jan 2002 12:44:44 +0100
References: <3C552627.3020801@web.de>
In-Reply-To: <3C552627.3020801@web.de>
MIME-Version: 1.0
Message-Id: <E16VADb-0000HU-00@linuxlab.wdf.sap-ag.de>
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

On Monday 28 January 2002 11:21, Sven Cronenberg wrote:
> Hi !
> I am running PARISC Linux on an HP9000/735 workstation. I use the latest
> kernel and updated the debian packages yesterday. Still the 'i' and the 'o'
> key don't work under XFree. Everything else works fine. Has anyone found a
> solution for using those keys under XFree on a HIL Keyboard?
>
> Sven

Hi Sven,

I started to debug it, but didn't find an solution yet.
AFAIT it's not related to any bug in the xkb maps, instead it seems to be a bug
somewhere in the X Server itself.
I'm still working on it, but of course any help much appreciated.

Regards,
Helge
