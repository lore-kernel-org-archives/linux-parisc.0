Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cicero.e-mis.co.uk (cicero.e-mis.co.uk [212.240.194.162])
	by dsl2.external.hp.com (Postfix) with ESMTP id C5759482B
	for <parisc-linux@lists.parisc-linux.org>; Wed, 24 Apr 2002 06:00:05 -0600 (MDT)
To: s-clarob@st-aidans.cumbria.sch.uk
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Setting blackbox as default WM
References: <5.1.0.14.0.20020424115946.00a67b30@10.106.16.2>
	<3CC69B80.1020509@tuxfamily.org>
From: James Troup <james@nocrew.org>
Date: 24 Apr 2002 13:00:01 +0100
In-Reply-To: <3CC69B80.1020509@tuxfamily.org>
Message-ID: <87k7qxwblq.fsf@tacitus.systems>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

Thomas Marteau <marteaut@tuxfamily.org> writes:

> Hi,
> 
> > How do I specify black box to be my default windows manager, it's a
> > long time since I have had to do this and that was on a RH6 based
> > system.
> 
> put the complete path to black box executable in your ~/.xinitrc and
> startx will automatically run black box as your window manager.

Or, to change it system-wide 'update-alternatives --config
x-window-manager'.

-- 
James
