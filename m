Return-Path: <soete.joel@tiscali.be>
Received: from smtp-out.tiscali.be (spoolo2.tiscali.be [62.235.13.211])
	by dsl2.external.hp.com (Postfix) with ESMTP id 31C93486E
	for <parisc-linux@lists.parisc-linux.org>;
	Sat,  3 Jan 2004 04:26:57 -0700 (MST)
Message-ID: <3FF6A74F.3000108@tiscali.be>
Date: Sat, 03 Jan 2004 11:28:15 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: Matt Lewis <nitephyre@iinet.net.au>
Subject: Re: [parisc-linux] Probem Installing: slang(version).deb corrupt
References: <000801c3d1de$08e053d0$0101a8c0@nitephyre>
In-Reply-To: <000801c3d1de$08e053d0$0101a8c0@nitephyre>
Content-Type: text/plain; charset=us-ascii; format=flowed
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>



Matt Lewis wrote:
> Hi, I have a HP Visualize C3000 and i'm trying to install Debian HPPA on it... and every time i try to install the base system, whether it be from CD or http, i get the message of "slang(version_here).deb is corrupt. could not download"
> 
> is there any way around this?

IIRC, the c3k require a more recent kernel and what could help is a recent net-install iso cd available at:
<http://www.pateam.org/cd-images/testing/>

and this install would work via a serial console (simply unplug kdb amd mouse and pdc will swicth automaticaly to this serial 
console).

  since my machine hasn't got HPUX on it, and i cant find anywhere to download it :|
> 
Yes AFAIK you would have to order this CD near HP.

hth,
	Joel
