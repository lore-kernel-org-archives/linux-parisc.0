From: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] Re: linux-2.6 deller (ioremap-changes) and more
Date: Mon, 17 Apr 2006 15:03:07 +0000
Message-ID: <4443AE2B.4050103@tiscali.be>
References: <200603261906.k2QJ673c007796@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: deller@gmx.de,
 parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <soete.joel@tiscali.be>
In-Reply-To: <200603261906.k2QJ673c007796@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>



John David Anglin wrote:
>>>I'm running libc6-2.3.6-4 and see some strange crashes. Might it be related, or does  2.3.6-4 doesn't includes your fix ?
> 
> 
> 2.3.6-4 should have the glibc fix...
> 
> 
>>Do you know in which gcc-4.0 dpkg release the jda patch 
>>(<http://lists.parisc-linux.org/pipermail/parisc-linux/2006-March/028548.html>) was in?
>>I can so check in buildd with which compiler this new glibc-2.3.6-4 was build ;-)
> 
> 
> As far as GCC goes, the fix is now in all 4.x branches but not in 3.4.
> I'm not sure about the debian status.  I believe that Matthias integrated
> the change but there was a regression due to a missing glibc patch
> needed to prevent a SIGSEGV in the unwind code.  Matthias said this
> problem was fixed on March 20.
Sorry for delay but I come back to you with this stuff because I finaly take some time today to make some free space to check:
	* this patch is included into gcc-snapshot dpkg (namely ref to 2006 03 25 ;-) )
	* but neither gcc-4.0 nor gcc-4.1 dpkg contained this patch ;-(
	  (should I ask to Matthias, aka doko, lol?)

Thanks,
	Joel
