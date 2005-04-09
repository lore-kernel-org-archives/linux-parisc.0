From: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] SLAB bug SMP 64bit / XFS mess
Date: Sat, 09 Apr 2005 13:25:40 +0000
Message-ID: <4257D7D4.80401@tiscali.be>
References: <200504090100.j3910CW0019308@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: James.Bottomley@SteelEye.com,
 parisc-linux@lists.parisc-linux.org,
 Thibaut VARENE <T-Bone@parisc-linux.org>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200504090100.j3910CW0019308@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org



John David Anglin wrote:
>>It's also quite surprising the 32bit kernel is unaffected.
> 
well nothing new since: <http://lists.parisc-linux.org/pipermail/parisc-linux/2005-March/026055.html>

> 
> As a plug for my put_user patch, I recall that there is at least one
> xfs ioctl that involves putting a long int to userspace.
> 
Yes iirc that was (in 2.4) one of the reason I asked help to Randolph to introduce put_user_asm64() for 32bit kernel.

Joel
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
