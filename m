Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id E92D14865
	for <parisc-linux@lists.parisc-linux.org>; Thu, 29 Aug 2002 08:31:10 -0600 (MDT)
Message-ID: <3D6E258B.6010600@gmx.de>
Date: Thu, 29 Aug 2002 15:45:47 +0200
From: Christian Schmitt <chris.81@gmx.de>
Reply-To: christian@familieschmitt.de
MIME-Version: 1.0
To: Helge Deller <helge.deller@sap.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Harmony on 710 working?
References: <3D6CDF5A.5090205@gmx.de> <200208281906.14844.helge.deller@sap.com>
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
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

Helge Deller wrote:
> On Wednesday 28 August 2002 16:34, Christian Schmitt wrote:
> 
>>I recently downloaded and compiled the latest pa-kernel. I also included
>>harmony sound support and now I would like to know if and how I can access
>>the sound device. Serching on the web was no success.
> 
> 
> insmod harmony
> aumix
> mpg123 <your-favorite-mp3-file>
> 

I recompiled the kernel with harmony as a module. I get unresolved symbols when 
loading the harmony driver:

ccio_get_fake

Any suggestions?

Chris


-- 
Linux - Cause life is too short for reboots
