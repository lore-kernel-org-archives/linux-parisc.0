From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] K410 SCSI 53c700 issue with PLEXTOR PX-R820T
Date: Sun, 12 Nov 2006 12:14:37 -0700
Message-ID: <20061112191436.GY16952@parisc-linux.org>
References: <20061112160350.8b7d4afd.gmsoft@tuxicoman.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@parisc-linux.org
To: Guy Martin <gmsoft@tuxicoman.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20061112160350.8b7d4afd.gmsoft@tuxicoman.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, Nov 12, 2006 at 04:03:50PM +0100, Guy Martin wrote:
> This is how 2.4 detects it :
> scsi3: (4:0) Synchronous at offset 8, period 100ns
>   Vendor: PLEXTOR   Model: CD-R   PX-R820T   Rev: 1.08
>   Type:   CD-ROM                             ANSI SCSI revision: 02
> 
> And this is how 2.6 detects it :
> [42949430.090000]   Vendor: PLEXTOR   Model: CD-R   PX-R820T   Rev: 1.08
> [42949430.150000]   Type:   CD-ROM                             ANSI SCSI revision: 02
> [42949430.170000]  target2:0:4: Beginning Domain Validation
> [42949430.180000]  target2:0:4: asynchronous
> [42949430.190000]  target2:0:4: FAST-10 SCSI 10.0 MB/s ST (100 ns, offset 8)
> [42949430.200000]  target2:0:4: Domain Validation skipping write tests
> [42949430.210000]  target2:0:4: Ending Domain Validation
> 
> 
> The main difference seems that 2.4 detects and syncronous drive while 2.6 detects an async one.

Um, you're just confused by the debug output from the DV code.  First it
negotiates async, then it negotiates FAST-10.

> Full 2.4 dmesg : https://www.tuxicoman.be/temp/dmesg-2.4-53c700
> Full 2.6 dmesg : https://www.tuxicoman.be/temp/dmesg-2.6-53c700
> 2.6 kernel config : https://www.tuxicoman.be/temp/k410-2.6.18.2-pa0.config
> 
> On my 2.6 kernel, when you try to mount it, you get the those error messages in loop.
> 
> Please have a look at it and let me know if you need any other info.

Presumably at some point in 2.6, this device worked fine.  Any chance
you could bisect and figure out when it started failing?  I'd start with
looking at something in the 2.6.8 sort of timeframe.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
