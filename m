Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtpde02.sap-ag.de (smtpde02.sap-ag.de [155.56.68.170])
	by dsl2.external.hp.com (Postfix) with ESMTP id 300D7483B
	for <parisc-linux@lists.parisc-linux.org>; Wed, 28 Aug 2002 11:06:36 -0600 (MDT)
From: Helge Deller <helge.deller@sap.com>
To: christian@familieschmitt.de, Christian Schmitt <chris.81@gmx.de>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Harmony on 710 working?
Date: Wed, 28 Aug 2002 19:06:14 +0200
References: <3D6CDF5A.5090205@gmx.de>
In-Reply-To: <3D6CDF5A.5090205@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-15"
Message-Id: <200208281906.14844.helge.deller@sap.com>
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

On Wednesday 28 August 2002 16:34, Christian Schmitt wrote:
> I recently downloaded and compiled the latest pa-kernel. I also included
> harmony sound support and now I would like to know if and how I can access
> the sound device. Serching on the web was no success.

insmod harmony
aumix
mpg123 <your-favorite-mp3-file>

Greetings,
Helge
