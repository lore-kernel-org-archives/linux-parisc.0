Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from bbnrel4.net.external.hp.com (bbnrel4.net.external.hp.com [155.208.254.68])
	by dsl2.external.hp.com (Postfix) with ESMTP id AC61E4829
	for <parisc-linux@lists.parisc-linux.org>; Wed,  9 Oct 2002 06:44:54 -0600 (MDT)
Received: from iws1pb05.france.hp.com (unknown [15.124.72.14])
	by bbnrel4.net.external.hp.com (Postfix) with ESMTP id C778E45D
	for <parisc-linux@lists.parisc-linux.org>; Wed,  9 Oct 2002 14:44:46 +0200 (METDST)
Message-ID: <3DA424C6.58F6806C@hpfrcu81.france.hp.com>
Date: Wed, 09 Oct 2002 14:44:54 +0200
From: phi <phi@hpfrcu81.france.hp.com>
MIME-Version: 1.0
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] boot (micro) hang
References: <3DA2945D.7010301@visoel.de>  <3DA2E27B.5708975E@hpfrcu81.france.hp.com> <20021008170152.AD42D4839@dsl2.external.hp.com>
Content-Type: text/plain; charset=us-ascii
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

Grant Grundler wrote:
> The long delay happens during device discovery.
> You could enable EARLY_BOOTUP_DEBUG in arch/parisc/kernel/pdc_cons.c
> and add some printk's to the loop in system_map_inventory().
> 
> Only two pieces of code really get executed during that time.
> One is the PDC calls - verify your firmware is the latest and if it
> isn't, please update.  The other might be GSC buswalk code. I thought
> the bus's under U2 are walked to detect devices not listed by PDC.
> But I don't know exactly when that occurs in the boot sequence.
> 
> grant

My Firmware is

Firmware Version  5.2
Duplex Console IO Dependent Code (IODC) revision 1
Boot IO Dependent Code (IODC) revision 153


Dunno if this is good enuff. At least it works for old kernel.


==================================================================

printk() into walk_native_bus() as follow shos this.

static void walk_native_bus(unsigned long io_io_low, unsigned long io_io_high,
                            struct parisc_device *parent)
{
        int i, devices_found = 0;
        unsigned long hpa = io_io_low;
        struct hardware_path path;

printk("1.1 low=0x%08x high=0x%08x\n",io_io_low,io_io_high);
        get_node_path(parent, &path);
        do {
printk("1.2 i=%d hpa=0x%08x\n",0,hpa);
                for (i = 0; i < MAX_NATIVE_DEVICES; i++, hpa +=
NATIVE_DEVICE_OF
FSET) {
                        struct parisc_device *dev;

                        /* Was the device already added by Firmware? */
                        dev = find_device_by_addr(hpa);
                        if (!dev) {
                                path.mod = i;
printk("1.3 i=%d hpa=0x%08x\n",i,hpa);
                                dev = alloc_pa_dev(hpa, &path);
                                if (!dev)
                                        continue;

printk("1.4\n");
                                register_parisc_device(dev);
                                devices_found++;
                        }
                        walk_lower_bus(dev);
                }
        } while (!devices_found && hpa < io_io_high);
}

1.1 low=0xfff80000 high=0xfffc0000
1.2 i=0 hpa=0xfff80000
1.3 i=0 hpa=0xfff80000
1.3 i=1 hpa=0xfff81000
1.3 i=2 hpa=0xfff82000
1.3 i=3 hpa=0xfff83000
1.3 i=4 hpa=0xfff84000
1.3 i=5 hpa=0xfff85000
1.3 i=6 hpa=0xfff86000
1.3 i=7 hpa=0xfff87000
1.3 i=8 hpa=0xfff88000
1.4
1.1 low=0xf2000000 high=0xf4000000
1.2 i=0 hpa=0xf2000000
1.3 i=1 hpa=0xf2001000
1.4
1.3 i=2 hpa=0xf2002000
1.3 i=3 hpa=0xf2003000
1.4
1.3 i=4 hpa=0xf2004000
1.3 i=5 hpa=0xf2005000
1.3 i=6 hpa=0xf2006000
1.3 i=7 hpa=0xf2007000
1.3 i=8 hpa=0xf2008000
1.3 i=9 hpa=0xf2009000
1.3 i=10 hpa=0xf200a000
1.3 i=11 hpa=0xf200b000
1.3 i=13 hpa=0xf200d000
1.3 i=14 hpa=0xf200e000
1.3 i=15 hpa=0xf200f000
1.3 i=16 hpa=0xf2010000
1.3 i=17 hpa=0xf2011000
1.3 i=18 hpa=0xf2012000
1.3 i=19 hpa=0xf2013000
1.3 i=20 hpa=0xf2014000
1.3 i=21 hpa=0xf2015000
1.3 i=22 hpa=0xf2016000
1.3 i=23 hpa=0xf2017000
1.3 i=24 hpa=0xf2018000
1.3 i=25 hpa=0xf2019000
1.3 i=26 hpa=0xf201a000
1.3 i=27 hpa=0xf201b000
1.3 i=28 hpa=0xf201c000
1.3 i=29 hpa=0xf201d000
1.3 i=30 hpa=0xf201e000
1.3 i=31 hpa=0xf201f000
1.3 i=32 hpa=0xf2020000
1.3 i=33 hpa=0xf2021000
1.3 i=34 hpa=0xf2022000
1.3 i=35 hpa=0xf2023000
1.3 i=36 hpa=0xf2024000
1.3 i=37 hpa=0xf2025000
1.3 i=38 hpa=0xf2026000
1.3 i=39 hpa=0xf2027000
1.3 i=40 hpa=0xf2028000
1.3 i=41 hpa=0xf2029000
1.3 i=42 hpa=0xf202a000
1.3 i=43 hpa=0xf202b000
1.3 i=44 hpa=0xf202c000
1.3 i=45 hpa=0xf202d000
1.3 i=46 hpa=0xf202e000
1.3 i=47 hpa=0xf202f000
1.3 i=48 hpa=0xf2030000
1.3 i=49 hpa=0xf2031000
1.3 i=50 hpa=0xf2032000
1.3 i=51 hpa=0xf2033000
1.3 i=52 hpa=0xf2034000
1.3 i=53 hpa=0xf2035000
1.3 i=54 hpa=0xf2036000
1.3 i=55 hpa=0xf2037000
1.3 i=56 hpa=0xf2038000
1.3 i=57 hpa=0xf2039000
1.3 i=58 hpa=0xf203a000
1.3 i=59 hpa=0xf203b000
1.3 i=60 hpa=0xf203c000
1.3 i=61 hpa=0xf203d000
1.3 i=62 hpa=0xf203e000
1.3 i=9 hpa=0xfff89000
1.3 i=10 hpa=0xfff8a000
1.4
1.1 low=0xf1000000 high=0xf2000000
1.2 i=0 hpa=0xf1000000
1.3 i=0 hpa=0xf1000000
1.3 i=1 hpa=0xf1001000
1.3 i=2 hpa=0xf1002000
1.3 i=3 hpa=0xf1003000
1.3 i=4 hpa=0xf1004000
1.3 i=5 hpa=0xf1005000
1.3 i=6 hpa=0xf1006000
1.3 i=7 hpa=0xf1007000
1.3 i=8 hpa=0xf1008000
1.3 i=9 hpa=0xf1009000
1.3 i=10 hpa=0xf100a000
1.3 i=11 hpa=0xf100b000
1.3 i=12 hpa=0xf100c000
1.3 i=13 hpa=0xf100d000
1.3 i=14 hpa=0xf100e000
1.3 i=15 hpa=0xf100f000
1.3 i=16 hpa=0xf1010000
1.3 i=17 hpa=0xf1011000
1.3 i=18 hpa=0xf1012000
1.3 i=19 hpa=0xf1013000
1.3 i=20 hpa=0xf1014000
1.3 i=21 hpa=0xf1015000
1.3 i=22 hpa=0xf1016000
1.3 i=23 hpa=0xf1017000
1.3 i=24 hpa=0xf1018000
1.3 i=25 hpa=0xf1019000
1.3 i=26 hpa=0xf101a000
1.3 i=27 hpa=0xf101b000
1.3 i=28 hpa=0xf101c000
1.3 i=29 hpa=0xf101d000
1.3 i=30 hpa=0xf101e000
1.3 i=31 hpa=0xf101f000
1.3 i=32 hpa=0xf1020000
1.3 i=33 hpa=0xf1021000
1.3 i=34 hpa=0xf1022000
1.3 i=35 hpa=0xf1023000
1.3 i=36 hpa=0xf1024000
1.3 i=37 hpa=0xf1025000
1.3 i=38 hpa=0xf1026000
1.3 i=39 hpa=0xf1027000
1.3 i=40 hpa=0xf1028000
1.3 i=41 hpa=0xf1029000
1.3 i=42 hpa=0xf102a000
1.3 i=43 hpa=0xf102b000
1.3 i=44 hpa=0xf102c000
1.3 i=45 hpa=0xf102d000
1.3 i=46 hpa=0xf102e000
1.3 i=47 hpa=0xf102f000
1.3 i=48 hpa=0xf1030000
1.3 i=49 hpa=0xf1031000
1.3 i=50 hpa=0xf1032000
1.3 i=51 hpa=0xf1033000
1.3 i=52 hpa=0xf1034000
1.3 i=53 hpa=0xf1035000
1.3 i=54 hpa=0xf1036000
1.3 i=55 hpa=0xf1037000
1.3 i=56 hpa=0xf1038000
1.3 i=57 hpa=0xf1039000
1.3 i=58 hpa=0xf103a000
1.3 i=59 hpa=0xf103b000
1.3 i=60 hpa=0xf103c000
1.3 i=61 hpa=0xf103d000
1.3 i=62 hpa=0xf103e000
1.2 i=0 hpa=0xf1040000
1.3 i=0 hpa=0xf1040000
1.3 i=1 hpa=0xf1041000
1.3 i=2 hpa=0xf1042000
1.3 i=3 hpa=0xf1043000
1.3 i=4 hpa=0xf1044000
1.3 i=5 hpa=0xf1045000
1.3 i=6 hpa=0xf1046000
1.3 i=7 hpa=0xf1047000
1.3 i=8 hpa=0xf1048000
1.3 i=9 hpa=0xf1049000
1.3 i=10 hpa=0xf104a000
1.3 i=11 hpa=0xf104b000
1.3 i=12 hpa=0xf104c000
1.3 i=13 hpa=0xf104d000
1.3 i=14 hpa=0xf104e000
1.3 i=15 hpa=0xf104f000
1.3 i=16 hpa=0xf1050000
1.3 i=17 hpa=0xf1051000
1.3 i=18 hpa=0xf1052000
1.3 i=19 hpa=0xf1053000
1.3 i=20 hpa=0xf1054000
1.3 i=21 hpa=0xf1055000
1.3 i=22 hpa=0xf1056000
1.3 i=23 hpa=0xf1057000
1.3 i=24 hpa=0xf1058000
1.3 i=25 hpa=0xf1059000
1.3 i=26 hpa=0xf105a000
1.3 i=27 hpa=0xf105b000
1.3 i=28 hpa=0xf105c000
1.3 i=29 hpa=0xf105d000
1.3 i=30 hpa=0xf105e000
1.3 i=31 hpa=0xf105f000
1.3 i=32 hpa=0xf1060000
1.3 i=33 hpa=0xf1061000
1.3 i=34 hpa=0xf1062000
1.3 i=35 hpa=0xf1063000
1.3 i=36 hpa=0xf1064000
1.3 i=37 hpa=0xf1065000
1.3 i=38 hpa=0xf1066000
1.3 i=39 hpa=0xf1067000
1.3 i=40 hpa=0xf1068000
1.3 i=41 hpa=0xf1069000
1.3 i=42 hpa=0xf106a000
1.3 i=43 hpa=0xf106b000
1.3 i=44 hpa=0xf106c000
1.3 i=45 hpa=0xf106d000
1.3 i=46 hpa=0xf106e000
1.3 i=47 hpa=0xf106f000
1.3 i=48 hpa=0xf1070000
1.3 i=49 hpa=0xf1071000
1.3 i=50 hpa=0xf1072000
1.3 i=51 hpa=0xf1073000
1.3 i=52 hpa=0xf1074000
1.3 i=53 hpa=0xf1075000
1.3 i=54 hpa=0xf1076000
1.3 i=55 hpa=0xf1077000
1.3 i=56 hpa=0xf1078000
1.3 i=57 hpa=0xf1079000
1.3 i=58 hpa=0xf107a000
1.3 i=59 hpa=0xf107b000
1.3 i=60 hpa=0xf107c000
1.3 i=61 hpa=0xf107d000
1.3 i=62 hpa=0xf107e000
1.3 i=63 hpa=0xf107f000
1.2 i=0 hpa=0xf1080000
1.3 i=0 hpa=0xf1080000
1.3 i=1 hpa=0xf1081000
1.3 i=2 hpa=0xf1082000
1.3 i=3 hpa=0xf1083000
1.3 i=4 hpa=0xf1084000
1.3 i=5 hpa=0xf1085000
1.3 i=6 hpa=0xf1086000
1.3 i=7 hpa=0xf1087000
1.3 i=8 hpa=0xf1088000
1.3 i=9 hpa=0xf1089000
1.3 i=10 hpa=0xf108a000
1.3 i=11 hpa=0xf108b000
1.3 i=12 hpa=0xf108c000
1.3 i=13 hpa=0xf108d000
1.3 i=14 hpa=0xf108e000
1.3 i=15 hpa=0xf108f000
1.3 i=16 hpa=0xf1090000
1.3 i=17 hpa=0xf1091000
1.3 i=18 hpa=0xf1092000
1.3 i=19 hpa=0xf1093000
1.3 i=20 hpa=0xf1094000
1.3 i=21 hpa=0xf1095000
1.3 i=22 hpa=0xf1096000
1.3 i=23 hpa=0xf1097000
1.3 i=24 hpa=0xf1098000
1.3 i=25 hpa=0xf1099000
1.3 i=26 hpa=0xf109a000
1.3 i=27 hpa=0xf109b000
1.3 i=28 hpa=0xf109c000
1.3 i=29 hpa=0xf109d000
1.3 i=30 hpa=0xf109e000
1.3 i=31 hpa=0xf109f000
1.3 i=32 hpa=0xf10a0000
1.3 i=33 hpa=0xf10a1000
1.3 i=34 hpa=0xf10a2000
1.3 i=35 hpa=0xf10a3000
1.3 i=36 hpa=0xf10a4000
1.3 i=37 hpa=0xf10a5000
1.3 i=38 hpa=0xf10a6000
1.3 i=39 hpa=0xf10a7000
1.3 i=40 hpa=0xf10a8000
1.3 i=41 hpa=0xf10a9000
1.3 i=42 hpa=0xf10aa000
1.3 i=43 hpa=0xf10ab000
1.3 i=44 hpa=0xf10ac000
1.3 i=45 hpa=0xf10ad000
1.3 i=46 hpa=0xf10ae000
1.3 i=47 hpa=0xf10af000
1.3 i=48 hpa=0xf10b0000
1.3 i=49 hpa=0xf10b1000
1.3 i=50 hpa=0xf10b2000
1.3 i=51 hpa=0xf10b3000
1.3 i=52 hpa=0xf10b4000
1.3 i=53 hpa=0xf10b5000
1.3 i=54 hpa=0xf10b6000
1.3 i=55 hpa=0xf10b7000
1.3 i=56 hpa=0xf10b8000
1.3 i=57 hpa=0xf10b9000
1.3 i=58 hpa=0xf10ba000
1.3 i=59 hpa=0xf10bb000
1.3 i=60 hpa=0xf10bc000
1.3 i=61 hpa=0xf10bd000
1.3 i=62 hpa=0xf10be000
1.3 i=63 hpa=0xf10bf000
1.2 i=0 hpa=0xf10c0000


I am not knowledeable enough to tell if the range to walk on is valid or not,
but it is way too  much for my config.

I wonder if this functin got the range correctly
void walk_lower_bus(struct parisc_device *dev)
{
        unsigned long io_io_low, io_io_high;

        if(!BUS_CONVERTER(dev) || IS_LOWER_PORT(dev))
                return;

        io_io_low = ((unsigned long)(signed int)READ_IO_IO_LOW(dev) +
~FLEX_MASK
) & FLEX_MASK;
        io_io_high = ((unsigned long)(signed int)READ_IO_IO_HIGH(dev) +
~FLEX_MA
SK) & FLEX_MASK;

        walk_native_bus(io_io_low, io_io_high, dev);
}


For the time being I enforce

io_io_high=io_io_low+(MAX_NATIVE_DEVICES*NATIVE_DEVICE_OFFSET);

In the above function which as the effect of shortening the loop and boot ok.
Dunno if this hack make sense, may be I would loose some devices, but I don't
plan to add any anyway.

Phi


--
mailto:Philippe_Benard@hp.com [ HPS-SE HP-UX kernel debugging tools ]
