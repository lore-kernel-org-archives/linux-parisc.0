Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from bbnrel4.net.external.hp.com (bbnrel4.net.external.hp.com [155.208.254.68])
	by dsl2.external.hp.com (Postfix) with ESMTP id 92FE5484D
	for <parisc-linux@lists.parisc-linux.org>; Mon, 10 Jun 2002 23:58:00 -0600 (MDT)
Message-ID: <3D059013.9272EEEA@admin.france.hp.com>
Date: Tue, 11 Jun 2002 07:52:19 +0200
From: Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
MIME-Version: 1.0
To: Randolph Chung <randolph@tausq.org>
Cc: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Pb with ioctl and 64bits
References: <3D04BD42.446D930@admin.france.hp.com> <20020610152428.GB5876@tausq.org>
Content-Type: multipart/mixed;
 boundary="------------FF9D73B59D549C57264DDB22"
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

This is a multi-part message in MIME format.
--------------FF9D73B59D549C57264DDB22
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

	Hi
Yes, I've follow nearly the same than "PA_PERF_ON", "PA_PERF_OFF".
I've used:
#define DIOSDUMPDEV             _IOW('p',1,unsigned long)       /* set the dump device                 */
#define DIOGDUMPDEV             _IOR('p',2,unsigned long)       /* get the dump device                 */
#define DIOSDUMPLEVEL           _IOW('p',3,unsigned long)       /* set the dump level                  */
#define DIOGDUMPLEVEL           _IOR('p',4,unsigned long)       /* get the dump level                  */
#define DIOSDUMPFLAGS           _IOW('p',5,unsigned long)       /* set the dump flag parameters        */
#define DIOGDUMPFLAGS           _IOR('p',6,unsigned long)       /* get the dump flag parameters        */
#define DIOSDUMPCOMPRESS        _IOW('p',7,unsigned long)       /* set the dump compress level         */
#define DIOGDUMPCOMPRESS        _IOR('p',8,unsigned long)       /* get the dump compress level         */
#define DIOGDINDEX              _IOR('p',9,unsigned long)       /* get the number of configured device */ 

But I don't understand what's wrong, does I need to declare something else somewhere else ????

Randolph Chung wrote:
> 
> > I'm loosing my nerves. I'm stuck with it since two days, and I don't understand :-(
> > My ioctls are running fine with 32bits kernel. I thought I've done everything fine,
> > but when compiling it with 64 bits kernel it fail with:
> > sys32_ioctl: Unknown cmd fd(3) cmd(80047001) arg(00000803)
> > So my question is: what is the difference between 32bits and 64bits kernel about
> > the ioctls ?
> 
> as you discovered, there's some translation that is needed for 64-bit
> kernels because userspace is always 32-bits. So when running a 64-bit
> kernel, some ioctls need to be translated via the logic in ioctl32.c.
> The situation is similar to sparc32/sparc64.
> 
> > I think that arch/parisc/kernel/ioctl32.c is used with 64bits and not with 32bits, right ?
> 
> yes.
> 
> > If yes, what I need to do more than:
> > #if defined(CONFIG_DUMP) || defined(CONFIG_DUMP_MODULE)
> > COMPATIBLE_IOCTL(DIOSDUMPDEV);
> > COMPATIBLE_IOCTL(DIOGDUMPDEV);
> > COMPATIBLE_IOCTL(DIOSDUMPLEVEL);
> > COMPATIBLE_IOCTL(DIOGDUMPLEVEL);
> > COMPATIBLE_IOCTL(DIOSDUMPFLAGS);
> > COMPATIBLE_IOCTL(DIOGDUMPFLAGS);
> > COMPATIBLE_IOCTL(DIOSDUMPCOMPRESS);
> > COMPATIBLE_IOCTL(DIOGDUMPCOMPRESS);
> > COMPATIBLE_IOCTL(DIOGDINDEX);
> > #endif /* DUMP */
> 
> what are the ioctl definitions used by the dump driver? (the _IO{,R,W,RW}
> values). From the output you pasted:
> 
> > sys32_ioctl: Unknown cmd fd(3) cmd(80047001) arg(00000803)
> 
> that ioctl seems to be _IOW('p', 1, int) (or unsigned int or so)?
> 
> randolph

-- 
	Vidal Bruno, (770-4271)
        SSD-HA Team, HP-UX & LINUX Support
	bruno_vidal@admin.france.hp.com
--------------FF9D73B59D549C57264DDB22
Content-Type: text/x-vcard; charset=iso-8859-1;
 name="bruno_vidal.vcf"
Content-Transfer-Encoding: base64
Content-Description: Card for Bruno Vidal
Content-Disposition: attachment;
 filename="bruno_vidal.vcf"

YmVnaW46dmNhcmQgCm46QnJ1bm87VklEQUwKdGVsO2ZheDowMS02OS04Mi02MC0xNAp0ZWw7
d29yazowMS02OS0yOS00Mi03MQp4LW1vemlsbGEtaHRtbDpUUlVFCnVybDp3d3cuZnJhbmNl
LmhwLmNvbQpvcmc6U29sdXRpb24gQ2VudGVyCnZlcnNpb246Mi4xCmVtYWlsO2ludGVybmV0
OmJydW5vX3ZpZGFsQGhwLmNvbQp0aXRsZTpFeHBlcnQgTG9naWNpZWwgRW52aXJvbm5lbWVu
dCBIYXV0ZSBEaXNwb25pYmlsaXTpCmFkcjtxdW90ZWQtcHJpbnRhYmxlOjs7SFAgRnJhbmNl
PTBEPTBBO1ouQSBkZSBDb3VydGFib2V1ZjsxIEF2LiBkdSBDYW5hZGE7OTE5NDcgTGVzIFVs
aXMgY2VkZXg7RnJhbmNlCngtbW96aWxsYS1jcHQ6OzI2MjA4CmZuOlZJREFMIEJydW5vCmVu
ZDp2Y2FyZAo=
--------------FF9D73B59D549C57264DDB22--
