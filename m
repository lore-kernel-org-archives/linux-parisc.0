From: John Marvin <jsm@fc.hp.com>
Subject: Re: [parisc-linux] [RFC] using 64bit wide registers with 32bit kernel
Date: Sat, 13 May 2006 23:06:59 -0600
Message-ID: <4466BAF3.8060608@fc.hp.com>
References: <200605132335.k4DNZmAY002050@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: parisc-linux@lists.parisc-linux.org,
 Thibaut VARENE <T-Bone@parisc-linux.org>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200605132335.k4DNZmAY002050@hiauly1.hia.nrc.ca>
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

> 
> I don't believe that it's impossible to support the full register width
> with a 32bit (narrow) kernel.  However, hpux to my knowledge doesn't
> support 64-bit registers when using a narrow kernel.  I think this
> reflects the historical development of hpux.  The first PA 2.0 kernels
> were narrow and based on the 32-bit PA 1.1 implementation.  Wide kernels
> were introduced with HP-UX 11.
> 

You are correct.

If you are running a 32 bit version of hpux on a 64 bit machine then the 
upper halfs of registers are not saved. I will note that there are not 
many (and may no longer be any) 64 bit machines that HP supports running 
a 32 bit kernel on.

If you are running a 64 bit version of hpux then the upper halfs of 
registers are saved during context switches, even if you are running a 
32 bit app. It gets interesting in a signal handler, since the registers 
are saved in the signal context twice, i.e. the 32 bit lower halfs are 
saved in one place (for backwards object compatibility), and then the 64 
bit versions are saved in another. I forget all the details about what 
happens if you want to change the saved value in the signal context.

John
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
