From: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] dmesg  about hw Modules
Date: Thu, 16 Sep 2004 15:59:55 +0000
Message-ID: <4149B87B.7020907@tiscali.be>
References: <A944EAC2E4952A4D9203CED00A8F4CC73549E6@SRVTSBC02.itc.ads.t-systems.es>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: parisc-linux@lists.parisc-linux.org
To: "Carlos Pares, Pere" <pere.carlos@t-systems.es>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <A944EAC2E4952A4D9203CED00A8F4CC73549E6@SRVTSBC02.itc.ads.t-systems.es>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hello Carlos,

Sorry to put this stupid question but which kernel did you try to boot? SMP support or not?

(that looks like to me as a pb I encounter with my c110 and a kernel 2.6.5 iirc; this was a ncr53c8xx bug fixed later, sorry I 
didn't remember exactly when :( ).

hth,
	Joel


Carlos Pares, Pere wrote:
> Hi,
> 
>  
> 
> This is what dmesg show me about some hw on my k360 HP box,
> 
>  
> 
> Have you any idea what's going wrong?
> 
>  
> 
> PS/2 psaux port at 0xffd08100 (irq 69) found, no device attached. 
> 
> lp0: using parport0 (interrupt-driven). 
> 
> Generic RTC Driver v1.07 
> 
> RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize 
> 
> loop: loaded (max 8 devices) 
> 
> Linux Tulip driver version 0.9.15-pre12 (Aug 9, 2002) 
> 
> PCI: Unable to reserve mem region #2:80@2040000 for device 00:01.0 
> 
> PCI: Unable to reserve mem region #2:80@2040000 for device 00:01.0 
> 
> PCI: Unable to reserve I/O region #1:80@40221200 for device 00:02.0 
> 
> PCI: Unable to reserve I/O region #1:80@40221200 for device 00:02.0 
> 
> Found i82596 at 0xffd07000, IRQ 87 
> 
> eth0: 82596 at 0xffd07000, 00 60 B0 C4 A4 F5 IRQ 87. 
> 
> 82596.c $Revision: 1.33 $ 
> 
> Uniform Multi-Platform E-IDE driver Revision: 7.00beta4-2.4 
> 
> ide: Assuming 33MHz system bus speed for PIO modes; override with
> idebus=xx 
> 
> SCSI subsystem driver Revision: 1.00 
> 
> zalon_scsi_callback: Zalon vers field is 0x1, IRQ 35 
> 
> ncr53c8xx: 53c720 detected 
> 
> ncr53c720-0: ID 7, Fast-10, Parity Checking, Differential
> 
>  
> 
>  
> 
> Thanks in advance
> 
>  
> 
>  
> 
>  
> 
>  
> 
> 
> 
> --------------------------------------------------------------------------------
> Aquest missatge electronic pot  contenir informacio confidencial o privilegiada.
> Si voste no es el destinatari del  missatge, o l'ha rebut per error, si us plau
> notifiqui-ho al remitent i destrueixi el missatge amb tot el seu contingut.
> Esta completament  prohibida  qualsevol  copia, us o distribucio no autoritzada
> del contingut d'aquest missatge electronic.
> --------------------------------------------------------------------------------
> Este mensaje electronico puede contener informacion confidencial o privilegiada.
> Si usted  no es  el destinatario de este mensaje o lo ha recibido por error, por
> favor notifiquelo al remitente y destruya el mensaje con todo su contenido.
> Queda  expresamente  prohibida  cualquier  copia, utilizacion o  distribucion no
> autorizada del contenido de este mensaje electronico.
> --------------------------------------------------------------------------------
> This e-mail may contain confidential and/or privileged information.
> If you  are  not the  intended recipient (or have received this e-mail in error)
> please notify the sender immediately and destroy this e-mail.
> Any  unauthorized  copying,  disclosure  or distribution of the material in this
> e-mail is strictly forbidden.
> --------------------------------------------------------------------------------
> 
> 
> 
> ------------------------------------------------------------------------
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
