Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust100.bre.cable.ntl.com [213.107.176.100])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9703F482C
	for <parisc-linux@lists.parisc-linux.org>; Wed, 14 Nov 2001 08:13:15 -0700 (MST)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 9EDFBB00C; Wed, 14 Nov 2001 15:13:31 +0000 (GMT)
Date: Wed, 14 Nov 2001 15:13:31 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Strohmayer Peter Hans <peter-hans.strohmayer@sbs.at>
Cc: "'parisc-linux@lists.parisc-linux.org'" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Installing Debian on a C180
Message-ID: <20011114151331.E30923@linuxcare.com>
References: <C10F60785AE7D211B6E00800060DA391028782A5@vieg128a.gud.siemens.at>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <C10F60785AE7D211B6E00800060DA391028782A5@vieg128a.gud.siemens.at>; from peter-hans.strohmayer@sbs.at on Wed, Nov 14, 2001 at 03:25:22PM +0100
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

On Wed, Nov 14, 2001 at 03:25:22PM +0100, Strohmayer Peter Hans wrote:
> Hello,
> 
> i have made a CD from the ISO.image and now i will install
> Debian on a C180 with a 4GB Harddisk.
> The partitionlayout is like the README, 20MB for palo and
> 1800MB for root, 800MB for swap and rest for anything.
> 
> But i have serious troubles to install the base system to the
> disk, the machine hang with a dumb while copying the *.deb
> packages to disk from CD.
> 
> Is there something special what should do on a C180?

We expect to have a new ISO real soon now (yes, I know we have
been saying that for a couple of months), could you wait and
try that when it is available please?

In the meantime, using serial console and capturing the boot
messages for us might be interesting.

Cheers,
  Richard
