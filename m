Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Mon, 2 Jun 2003 12:14:51 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: "Bjoern A. Zeeb" <bzeeb-lists@lists.zabbadoz.net>
Cc: Helge Deller <deller@gmx.de>, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] palo II
Message-ID: <20030602181451.GB31212@dsl2.external.hp.com>
References: <Pine.BSF.4.53.0306011303040.1237@e0-0.zab2.int.zabbadoz.net> <200306011543.59335.deller@gmx.de> <Pine.BSF.4.53.0306011402580.1237@e0-0.zab2.int.zabbadoz.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.BSF.4.53.0306011402580.1237@e0-0.zab2.int.zabbadoz.net>
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

On Sun, Jun 01, 2003 at 02:05:20PM +0000, Bjoern A. Zeeb wrote:
> When palo cannot open the kernel and errors out shouldn't it fall back
> to the dialog and ask one to which fields to change instead of simply
> running into a dead end where I think I can only recover from with
> physical access to the machine ?

The same issue has annoyed me too.
But not enough to hack on palo. I only work on machines remotely
if I have remote power control (eg A500).

Paul Bame is happy to take any patches people have to improve
this behaviour.  Source is available via anon CVS:
	cvs -d pserver:anonymous@cvs.parisc-linux.org login
	cvs -d pserver:anonymous@cvs.parisc-linux.org co palo

hth,
grant
