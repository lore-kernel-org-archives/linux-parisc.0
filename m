From: Joel Soete <soete.joel@tiscali.be>
Subject: [parisc-linux] Re: back to glibc-2.3.3 & gcc-3.4.1 pb
Date: Mon, 06 Sep 2004 20:26:57 +0000
Message-ID: <413CC811.4020401@tiscali.be>
References: <413775C8.3060108@tiscali.be>
	<20040903154019.GR32474@baldric.uwo.ca>
	<4138B043.2020009@tiscali.be>
	<20040904162953.GE32474@baldric.uwo.ca>
	<413AE748.3030207@tiscali.be> <413AFB1F.7010407@tiscali.be>
	<20040906200321.GO15721@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: parisc-linux@lists.parisc-linux.org
To: Carlos O'Donell <carlos@baldric.uwo.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040906200321.GO15721@baldric.uwo.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org



Carlos O'Donell wrote:
> Joel,
> 
> 
>>make[2]: *** [/space/jrso/parisc-linux/build/glibc/libio/tst-atime.out] 
> 
> 
> This is new. Could you see why this is failing?
> 
"atime has not changed"

mmm may be that's logical:
/dev/sda3		/		xfs		noatime			

hth,
	Joel
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
