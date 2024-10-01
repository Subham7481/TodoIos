import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    var body: some View {
        NavigationView{
            VStack{
                //Avatar
                if let user = viewModel.user
                {
                    profile(user: user)
                }
                else
                {
                    Text("Loading Profile....")
                }
                
            }.navigationTitle("Profile")
        }
        .onAppear {
            viewModel.fetchUser()
        }
    }
    @ViewBuilder
    func profile(user: User) -> some View
    {
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            .frame(width: 125, height: 125)
            .padding()
        
        //Personal Info
        VStack(alignment: .leading){
            HStack{
                Text("Name: ").bold()
                Text(user.name)
            }.padding()
            HStack{
                Text("Email: ").bold()
                Text(user.email)
            }.padding()
            HStack{
                Text("Member Since: ").bold()
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }.padding()
        }
        //Sign out
        Button("Logg Out")
        {
            viewModel.logOut()
        }.tint(.red)
            .padding()
        Spacer()
    }
}

#Preview {
    ProfileView()
}
