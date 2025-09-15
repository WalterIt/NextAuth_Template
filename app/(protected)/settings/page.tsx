
// import { useCurrentUser } from '@/hooks/use-current-user'
// import UserSettings from '@/components/user-settings'
import { auth } from '@/auth'

const SettingPage = async () => {
//   const session = await auth()

//   const user = session?.user

//   const content = (<UserSettings user={user!} />);
  const content = (<h1 className='text-2xl font-bold'>Settings Page</h1>);


  return (
    <>
    {content}
    
    </>

    
  )
}

export default SettingPage