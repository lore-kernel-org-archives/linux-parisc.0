From: Helge Deller <deller@gmx.de>
Subject: Re: parisc hardware clock
Date: Sat, 8 Oct 2016 23:20:17 +0200
Message-ID: <57F96311.8010808@gmx.de>
References: <alpine.LRH.2.20.1610090107540.12761@math.ut.ee>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
To: Meelis Roos <mroos@linux.ee>,
        "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.LRH.2.20.1610090107540.12761@math.ut.ee>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 09.10.2016 00:16, Meelis Roos wrote:
> On my Gentoo hppa systems with custom kernels, I get the following 
> error on bootup:
> 
>  * Setting system clock using the hardware clock [UTC] ...
> hwclock: settimeofday() failed: Invalid argument
>  * Failed to set the system clock

I don't see this on debian...

> Once the system has booted up, hwclock --hctosys and hwclock --systohc 
> work fine. Maybe something related to gentoo /etc/init.d/hwclock but 
> before reporting it there I want to understand it first.
> 
> 
> What RTC driver and options should be selected in the kernel for RTC 
> operations to work?
> 
> I have only RTC_DRV_GENERIC set for RTC drivers.

I have pretty much the same config options:
CONFIG_RTC_LIB=y
CONFIG_RTC_CLASS=y
CONFIG_RTC_HCTOSYS=y
CONFIG_RTC_HCTOSYS_DEVICE="rtc0"
CONFIG_RTC_SYSTOHC=y
CONFIG_RTC_SYSTOHC_DEVICE="rtc0"
CONFIG_RTC_INTF_SYSFS=y
CONFIG_RTC_INTF_PROC=y
CONFIG_RTC_INTF_DEV=y
CONFIG_RTC_I2C_AND_SPI=y
CONFIG_RTC_DRV_GENERIC=y

The only difference seems to be that I don't have
 CONFIG_RTC_INTF_DEV_UIE_EMUL=y

Helge

 
> 
> CONFIG_RTC_LIB=y
> CONFIG_RTC_CLASS=y
> CONFIG_RTC_HCTOSYS=y
> CONFIG_RTC_HCTOSYS_DEVICE="rtc0"
> CONFIG_RTC_SYSTOHC=y
> CONFIG_RTC_SYSTOHC_DEVICE="rtc0"
> # CONFIG_RTC_DEBUG is not set
> 
> #
> # RTC interfaces
> #
> CONFIG_RTC_INTF_SYSFS=y
> CONFIG_RTC_INTF_PROC=y
> CONFIG_RTC_INTF_DEV=y
> CONFIG_RTC_INTF_DEV_UIE_EMUL=y
> # CONFIG_RTC_DRV_TEST is not set
> #
> # I2C RTC drivers
> #
> 
> #
> # SPI RTC drivers
> #
> 
> #
> # SPI and I2C RTC drivers
> #
> 
> #
> # Platform RTC drivers
> #
> # CONFIG_RTC_DRV_DS1286 is not set
> # CONFIG_RTC_DRV_DS1511 is not set
> # CONFIG_RTC_DRV_DS1553 is not set
> # CONFIG_RTC_DRV_DS1685_FAMILY is not set
> # CONFIG_RTC_DRV_DS1742 is not set
> # CONFIG_RTC_DRV_DS2404 is not set
> # CONFIG_RTC_DRV_STK17TA8 is not set
> # CONFIG_RTC_DRV_M48T86 is not set
> # CONFIG_RTC_DRV_M48T35 is not set
> # CONFIG_RTC_DRV_M48T59 is not set
> # CONFIG_RTC_DRV_MSM6242 is not set
> # CONFIG_RTC_DRV_BQ4802 is not set
> # CONFIG_RTC_DRV_RP5C01 is not set
> # CONFIG_RTC_DRV_V3020 is not set
> 
> #
> # on-CPU RTC drivers
> #
> CONFIG_RTC_DRV_GENERIC=y
> 
> #
> # HID Sensor RTC drivers

