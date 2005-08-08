From: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] Results from NFS hang tests
Date: Mon, 08 Aug 2005 19:27:34 +0000
Message-ID: <42F7B226.5040501@tiscali.be>
References: <42E27D23.4050601@excelcia.org> <20050729081920.GU5500@levanta.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: parisc-linux@lists.parisc-linux.org
To: Richard Hirst <rhirst@levanta.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050729081920.GU5500@levanta.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org



Richard Hirst wrote:
> Just for the record, I'm running  2.6.13-rc3-pa0 built locally
> with gcc 4.0.1 on a B180 with a 4G disk, and have run your 'dd'
> test for 88 cycles so far without any problems.  The nfs mount
> is from a linux box running Fedora Core 3.
> 
> Richard
> 
Hello Richard,

May I ask your NFS kernel config?

(it seems to work fine for me too but without nfs v4;
btw I now manage my ft with ssh (may be stunnel and rsync would be a better sol?) so I spend less time for more test?)

Thank in advance,
	Joel
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
